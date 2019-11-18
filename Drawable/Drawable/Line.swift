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
    
    required init?(coder: NSCoder) {
        fatalError("uninitialized!")
    }
    
}
