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
        self.font = UIFont.boldSystemFont(ofSize: 12)
        self.textColor = UIColor.lightGray
    }
    
}
