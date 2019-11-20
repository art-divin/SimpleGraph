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
    
    public var model : GridModel? {
        didSet {
            self.prepareForDrawing()
        }
    }
    
    private var shapeLayer : CAShapeLayer?
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
        self.verticalLines.forEach { $0.removeFromSuperview() }
        self.horizontalLines.forEach { $0.removeFromSuperview() }
        self.verticalLines.removeAll()
        self.horizontalLines.removeAll()
        self.verticalLines.append(contentsOf: model.verticalLines(frame: self.frame))
        self.horizontalLines.append(contentsOf: model.horizontalLines(frame: self.frame))
        self.verticalLines.forEach { self.insertSubview($0, at: 0) }
        self.horizontalLines.forEach { self.insertSubview($0, at: 0) }
        self.setNeedsLayout()
    }
    
    private func drawLines(_ lines: [Line], padding: CGFloat) {
        lines.forEach {
            $0.adjustFrame(padding: padding)
            $0.setNeedsDisplay()
        }
    }
    
    func drawLines() {
        let verticalCount = CGFloat(self.verticalLines.count)
        let horizontalCount = CGFloat(self.horizontalLines.count)
        let lineWidth : CGFloat = 1.0
        let horizontalPadding : CGFloat = ceil(self.frame.width / verticalCount)// - verticalCount * lineWidth
        let verticalPadding : CGFloat = ceil(self.frame.height / horizontalCount)// - horizontalCount * lineWidth

        self.drawLines(self.verticalLines, padding: horizontalPadding)
        self.drawLines(self.horizontalLines, padding: verticalPadding)
        self.drawBezierPath()
    }
    
    func drawBezierPath() {
        let maxValue = self.model?.max ?? 0.0
        var points = self.verticalLines.map { $0.valuePoint(max: maxValue) }
        guard let first = points.first else {
            return
        }
        self.shapeLayer?.removeFromSuperlayer()
        points.remove(at: 0)
        let path = CGMutablePath()
        path.move(to: first)
        points.forEach { path.addLine(to: $0) }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.lineWidth = 3.0
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIView.theme.curveLineColor.cgColor
        self.shapeLayer = shapeLayer
        self.layer.addSublayer(shapeLayer)
    }
    
}
