//
//  GridModel.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit
import Interfaces

/**
 * This class represents data model for drawing `GridView`
 */
public class GridModel {
    
    /// can hold any number of horizontal objects
    private var horizontal : [String] = []
    
    /// can hold any number of vertical objects
    private var vertical : [String] = []
    
    private var bondData : [BondData]
    
    var max : Double = 0.0
    
    public init(bondData: [BondData]) {
        self.bondData = bondData
        self.processData()
    }
    
    private func processData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        self.vertical = self.bondData.map { dateFormatter.string(from: $0.date) }
        let sorted = Array(Set(self.bondData.map { $0.value })).sorted(by: { $0 > $1 })
        self.horizontal = sorted.map { "\($0)" }
        self.max = sorted.first ?? 0.0
    }

    private func construct<Drawable: Line>(from: [String], frame: CGRect, drawable: Drawable.Type) -> [Drawable] {
        var retVal : [Drawable] = []
        for (idx, text) in from.enumerated() {
            let line = drawable.init(frame: frame)
            line.textLabel.text = text
            line.position = idx
            retVal.append(line)
        }
        return retVal
    }
    
    func horizontalLines(frame: CGRect) -> [HorizontalLine] {
        return self.construct(from: self.horizontal, frame: frame, drawable: HorizontalLine.self)
    }
    
    func verticalLines(frame: CGRect) -> [VerticalLine] {
        let lines = self.construct(from: self.vertical, frame: frame, drawable: VerticalLine.self)
        for (idx, line) in lines.enumerated() {
            line.value = self.bondData[idx].value
        }
        return lines
    }
    
}
