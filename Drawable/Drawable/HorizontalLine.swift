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
    
    override var textFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 20, height: 20)
    }
    
}
