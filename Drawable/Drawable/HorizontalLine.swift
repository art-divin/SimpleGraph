//
//  HorizontalLine.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

class HorizontalLine : Line {
    
    override var direction: Line.Direction {
        return .horizontal
    }
    
    override func adjustFrame(padding: CGFloat) {
        super.adjustFrame(padding: padding)
        let x : CGFloat = 0.0
        let y = padding * 0.5 + CGFloat(self.position) * padding
        let width = self.frame.width
        let height : CGFloat = 1.0
        self.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    override var minPoint: CGPoint {
        return CGPoint(x: self.frame.minX, y: self.frame.minY)
    }
    
    override var maxPoint: CGPoint {
        return CGPoint(x: self.frame.maxX, y: self.frame.maxY - self.frame.height)
    }
    
    override var textFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 20, height: 20)
    }
    
}
