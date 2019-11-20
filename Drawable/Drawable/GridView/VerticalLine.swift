//
//  VerticalLine.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

class VerticalLine : Line {
    
    var value : NSDecimalNumber = 0.0 {
        didSet {
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 1
            formatter.minimumFractionDigits = 1
            self.valueLabel.text = formatter.string(from: self.value)
        }
    }
    
    var _valuePoint : CGPoint? {
        didSet {
            self.valueLabel.center = (self._valuePoint != nil) ? CGPoint(x: 0, y: self._valuePoint?.y ?? 0) : CGPoint.zero
            self.bringSubviewToFront(self.valueLabel)
        }
    }
    
    lazy var valueLabel : TextLabel = {
        return TextLabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }()
    
    required init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.valueLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func valuePoint(max: Double) -> CGPoint {
        let ratio = CGFloat(self.value.doubleValue / max)
        let originalHeight = self.frame.height
        var height = originalHeight
        height -= self.padding * 0.5
        let pointY : CGFloat = height - height * ratio
        self._valuePoint = CGPoint(x: self.minPoint.x, y: pointY)
        return self._valuePoint!
    }
    
    override var direction: Line.Direction {
        return .vertical
    }
    
    override func adjustFrame(padding: CGFloat) {
        super.adjustFrame(padding: padding)
        let x = padding + CGFloat(self.position) * padding
        let y : CGFloat = 0.0
        let width : CGFloat = 1.0
        let height = self.frame.height
        self.backgroundColor = UIView.theme.systemLineColor
        self.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    override var minPoint: CGPoint {
        return CGPoint(x: self.frame.minX, y: self.frame.minY)
    }
    
    override var maxPoint: CGPoint {
        return CGPoint(x: self.frame.maxX - self.frame.width, y: self.frame.maxY)
    }
    
    override var textFrame: CGRect {
        return CGRect(x: 0, y: self.frame.height - 20, width: 20, height: 20)
    }
    
}
