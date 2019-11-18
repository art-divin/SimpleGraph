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
    
    var shapeLayer : CAShapeLayer?
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("uninitialized!")
    }
    
    func setupShapeLayer() {
        if let shapeLayer = self.shapeLayer {
            shapeLayer.removeFromSuperlayer()
        }
        let minPoint = CGPoint(x: self.frame.minX, y: self.frame.minY)
        let maxPoint = CGPoint(x: self.frame.maxX, y: self.frame.maxY)
        let path = CGMutablePath()
        path.move(to: minPoint)
        path.addLine(to: maxPoint)
        
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 1
        layer.path = path
        self.shapeLayer = layer
        self.layer.addSublayer(layer)
    }
    
}
