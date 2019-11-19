//
//  Line.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

class Line : UIView {
    
    lazy var textLabel : UILabel = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.textLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("uninitialized!")
    }
    
    var minPoint : CGPoint {
        fatalError("override in subclass!")
    }
    
    var maxPoint : CGPoint {
        fatalError("override in subclass!")
    }
    
    func adjustFrame(padding: CGFloat) {
        self.textLabel.center = self.direction == .some(.horizontal) ? self.minPoint : self.maxPoint
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let maxPoint = self.maxPoint
        let path = CGMutablePath()
        path.move(to: minPoint)
        path.addLine(to: maxPoint)
        path.closeSubpath()
        context?.addPath(path)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.strokePath()
    }

}
