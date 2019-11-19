//
//  GridModel.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

/**
 * This class represents data model for drawing `GridView`
 */
public class GridModel {
    
    /// can hold any number of horizontal objects
    private var horizontal : [String]
    
    /// can hold any number of vertical objects
    private var vertical : [String]
    
    public init(horizontal: [String], vertical: [String]) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
    
    private func construct<Drawable: Line>(from: [String], drawable: Drawable.Type) -> [Line] {
        var retVal : [Line] = []
        for (idx, text) in from.enumerated() {
            if let line = drawable.init(coder: NSCoder()) {
                line.textLabel.text = text
                line.position = idx
                retVal.append(line)
            }
        }
        return retVal
    }
    
    var horizontalLines : [HorizontalLine] {
        return self.construct(from: self.horizontal, drawable: HorizontalLine.self) as? [HorizontalLine] ?? []
    }
    
    var verticalLines : [VerticalLine] {
        return self.construct(from: self.vertical, drawable: VerticalLine.self) as? [VerticalLine] ?? []
    }

    /// adjusts objects within `horizontal` and `vertical` to fit into `GridView` limitations
    func reduce() {
    }
    
}
