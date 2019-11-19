//
//  PickerView.swift
//  Drawable
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

public class PickerModel {
    
    var objects : [String]
    
    public init(objects: [String]) {
        self.objects = objects
    }
    
}

class PickerButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.applyTheme()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.applyTheme()
    }
    
    func applyTheme() {
        self.setTitleColor(UIView.theme.buttonTitleColor, for: .normal)
        self.setTitleColor(UIView.theme.buttonSelectedColor, for: .selected)
        self.setTitleColor(UIView.theme.buttonSelectedColor, for: .highlighted)
        self.titleLabel?.font = UIView.theme.buttonTitleFont
    }
    
}

public class PickerView : UIView {
    
    public var model : PickerModel? {
        didSet {
            self.setupSubviews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupSubviews() {
        guard let model = self.model else {
            fatalError("model was not set!")
        }
        let padding = ceil(self.frame.width / CGFloat(model.objects.count))
        for (idx, object) in model.objects.enumerated() {
            let x = padding * 0.5 + padding * CGFloat(idx)
            let y : CGFloat = self.frame.height * 0.5
            let center = CGPoint(x: x, y: y)
            let width : CGFloat = 25.0
            let height : CGFloat = 20.0
            let button = PickerButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
            button.center = center
            button.setTitle(object, for: .normal)
            self.addSubview(button)
        }
    }
    
}
