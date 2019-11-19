//
//  Line.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

class Line : UIView {
    
    lazy var textLabel : TextLabel = {
        return TextLabel(frame: self.textFrame)
    }()
    
    enum Direction {
        case horizontal
        case vertical
        case undefined
    }
    
    var textFrame : CGRect {
        fatalError("override in subclass!")
    }
    
    var direction : Direction {
        fatalError("override in subclass!")
    }
    
    var position : Int = 0
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.textLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("override in subclass!")
    }
    
    var minPoint : CGPoint {
        fatalError("override in subclass!")
    }
    
    var maxPoint : CGPoint {
        fatalError("override in subclass!")
    }
    
    func adjustFrame(padding: CGFloat) {
        self.textLabel.adjustDirection(direction: self.direction)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let maxPoint = self.maxPoint
        context?.move(to: self.minPoint)
        context?.addLine(to: maxPoint)
        context?.drawPath(using: .fillStroke)
    }

}
