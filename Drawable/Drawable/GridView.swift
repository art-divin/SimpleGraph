//
//  GridView.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

/**
 * This class draws `VerticalLine` and `HorizontalLine` according to the given `GridModel` object
 */
public class GridView : UIView {
    
    public var model : GridModel?
    
    private var verticalLines : [VerticalLine] = []
    private var horizontalLines : [HorizontalLine] = []
    
    init(model: GridModel) {
        self.model = model
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.prepareForDrawing()
        self.drawLines()
    }
    
    func prepareForDrawing() {
        guard let model = self.model else {
            fatalError("self.model was not set!")
        }
        // TODO: encapsulate within GridModel
        for (idx, text) in model.vertical.enumerated() {
            let line = VerticalLine(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            line.textLabel.text = text
            line.position = idx
            self.verticalLines.append(line)
        }
        for (idx, text) in model.horizontal.enumerated() {
            let line = HorizontalLine(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            line.textLabel.text = text
            line.position = idx
            self.horizontalLines.append(line)
        }
    }
    
    func drawLines() {
        // TODO: move to another func
        self.verticalLines.forEach { self.addSubview($0) }
        self.horizontalLines.forEach { self.addSubview($0) }
        
        // TODO: move to another func
        let linesWidth = CGFloat(1 * self.verticalLines.count)
        let horizontalPadding = ceil(self.frame.height / CGFloat(self.verticalLines.count) - linesWidth)
        let verticalPadding = ceil(self.frame.width / CGFloat(self.horizontalLines.count) - linesWidth)
        
        // TODO: make more abstract to "draw" any collection
        self.verticalLines.forEach {
            let x = verticalPadding * CGFloat(max($0.position, 1))
            let y : CGFloat = 0.0
            let width : CGFloat = 1.0
            let height = self.frame.height
            $0.frame = CGRect(x: x, y: y, width: width, height: height)
            $0.setupShapeLayer()
        }
        
        self.horizontalLines.forEach {
            let x : CGFloat = 0.0
            let y = horizontalPadding * CGFloat(max($0.position, 1))
            let width = self.frame.width
            let height : CGFloat = 1.0
            $0.frame = CGRect(x: x, y: y, width: width, height: height)
            $0.setupShapeLayer()
        }
    }
    
}
