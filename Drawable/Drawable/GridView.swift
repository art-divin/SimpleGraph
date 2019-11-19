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
        self.drawLines()
    }
    
    func prepareForDrawing() {
        guard let model = self.model else {
            fatalError("self.model was not set!")
        }
        self.verticalLines.append(contentsOf: model.verticalLines)
        self.horizontalLines.append(contentsOf: model.horizontalLines)
        self.verticalLines.forEach { self.addSubview($0) }
        self.horizontalLines.forEach { self.addSubview($0) }
    }
    
    private func drawLines(_ lines: [Line], padding: CGFloat) {
        lines.forEach {
            $0.adjustFrame(padding: padding)
            $0.setNeedsDisplay()
        }
    }
    
    func drawLines() {
        let horizontalPadding : CGFloat = ceil(self.frame.width / CGFloat(self.verticalLines.count))
        let verticalPadding : CGFloat = ceil(self.frame.height / CGFloat(self.horizontalLines.count))

        self.drawLines(self.verticalLines, padding: horizontalPadding)
        self.drawLines(self.horizontalLines, padding: verticalPadding)
    }
    
}
