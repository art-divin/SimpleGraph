//
//  VerticalLine.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

class VerticalLine : Line {
    
    override var direction: Line.Direction {
        return .vertical
    }
    
    override func adjustFrame(padding: CGFloat) {
        super.adjustFrame(padding: padding)
        let x = padding * 0.5 + CGFloat(self.position) * padding
        let y : CGFloat = 0.0
        let width : CGFloat = 1.0
        let height = self.frame.height
        self.backgroundColor = UIView.theme.lineColor
        self.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    override var minPoint: CGPoint {
        return CGPoint(x: self.frame.minX, y: self.frame.minY)
    }
    
    override var maxPoint: CGPoint {
        return CGPoint(x: self.frame.maxX - self.frame.width, y: self.frame.maxY)
    }
    
    override var textFrame: CGRect {
        return CGRect(x: 0, y: self.frame.height - 20, width: 20, height: 20)
    }
    
}
