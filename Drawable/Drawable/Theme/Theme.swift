//
//  Theme.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

public extension UIView {
    
    static private var _theme : Theme?
    static var theme : Theme {
        get {
            if let theme = self._theme {
                return theme
            }
            return ThemeDefault()
        }
        set {
            self._theme = newValue
        }
    }
    
}

public protocol Theme {
    
    var titleColor : UIColor { get }
    var buttonTitleColor : UIColor { get }
    var buttonSelectedColor : UIColor { get }
    var buttonHighlightedColor : UIColor { get }
    var titleFont : UIFont { get }
    var buttonTitleFont : UIFont { get }
    var backgroundColor : UIColor { get }
    var systemLineColor : UIColor { get }
    var curveLineColor : UIColor { get }
    
}

class ThemeDefault : Theme {
    
    var titleColor : UIColor { return UIColor.black }
    var backgroundColor : UIColor { return UIColor.clear }
    var systemLineColor: UIColor { return .black }
    var curveLineColor : UIColor { return .red }
    
    var buttonTitleColor : UIColor { return UIColor.black }
    var buttonSelectedColor : UIColor { return UIColor.magenta }
    var buttonHighlightedColor : UIColor { return UIColor.purple }
    var buttonTitleFont : UIFont { return UIFont.boldSystemFont(ofSize: 15) }
    
    var titleFont : UIFont { return UIFont.boldSystemFont(ofSize: 14) }
    
}
