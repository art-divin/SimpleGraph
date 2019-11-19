//
//  TextLabel.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

class TextLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("uninitialized!")
    }
    
    func setup() {
        self.font = UIView.theme.titleFont
        self.textColor = UIView.theme.titleColor
        self.textAlignment = .center
        self.backgroundColor = UIView.theme.backgroundColor
    }
    
    func adjustDirection(direction: Line.Direction) {
        var center : CGPoint
        switch direction {
        case .horizontal: center = CGPoint(x: self.frame.width, y: 0)
        case .vertical:
            if let superview = self.superview {
                center = CGPoint(x: 0, y: superview.frame.height - self.frame.height)
            } else {
                center = CGPoint(x: 0, y: 0)
            }
        case .undefined: fatalError("invalid direction provided!")
        }
        self.center = center
    }
    
}
