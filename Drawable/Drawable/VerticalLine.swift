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
    
    override var textFrame: CGRect {
        return CGRect(x: 0, y: self.frame.height - 20, width: 20, height: 20)
    }
    
}
