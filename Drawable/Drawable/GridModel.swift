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
    
    private func construct<Drawable: Line>(from: [String], frame: CGRect, drawable: Drawable.Type) -> [Line] {
        var retVal : [Line] = []
        for (idx, text) in from.enumerated() {
            let line = drawable.init(frame: frame)
            line.textLabel.text = text
            line.position = idx
            retVal.append(line)
        }
        return retVal
    }
    
    func horizontalLines(frame: CGRect) -> [HorizontalLine] {
        return self.construct(from: self.horizontal, frame: frame, drawable: HorizontalLine.self) as? [HorizontalLine] ?? []
    }
    
    func verticalLines(frame: CGRect) -> [VerticalLine] {
        return self.construct(from: self.vertical, frame: frame, drawable: VerticalLine.self) as? [VerticalLine] ?? []
    }

    /// adjusts objects within `horizontal` and `vertical` to fit into `GridView` limitations
    func reduce() {
    }
    
}
