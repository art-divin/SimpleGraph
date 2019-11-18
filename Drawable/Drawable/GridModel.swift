//
//  GridModel.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Foundation

/**
 * This class represents data model for drawing `GridView`
 */
public class GridModel {
    
    /// can hold any number of horizontal objects
    var horizontal : [String]
    
    /// can hold any number of vertical objects
    var vertical : [String]
    
    public init(horizontal: [String], vertical: [String]) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
    
    /// adjusts objects within `horizontal` and `vertical` to fit into `GridView` limitations
    func reduce() {
    }
    
}
