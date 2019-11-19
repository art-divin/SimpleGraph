//
//  ThemeBlue.swift
//  solution_2_ralikhamov
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit
import Drawable

class ThemeBlue : Theme {
    
    var titleColor: UIColor { return .black }
    var buttonTitleColor: UIColor { return .black }
    var buttonSelectedColor: UIColor { return .init(red: 105/255.0, green: 146/255.0, blue: 220/255.0, alpha: 1.0) }
    var buttonHighlightedColor: UIColor { self.buttonSelectedColor }
    var titleFont: UIFont { return .boldSystemFont(ofSize: 14) }
    var buttonTitleFont: UIFont { return .boldSystemFont(ofSize: 15) }
    var backgroundColor: UIColor { return .white }
    var lineColor: UIColor { return .init(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1.0) }
    
}
