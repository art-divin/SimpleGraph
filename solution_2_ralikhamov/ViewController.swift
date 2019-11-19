//
//  ViewController.swift
//  solution_2_ralikhamov
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit
import Drawable

class ViewController: UIViewController {

    @IBOutlet var gridView : GridView?
    @IBOutlet var pickerView : PickerView?
    
    func applyTheme() {
        let theme = ThemeBlue()
        UIView.theme = theme
        self.gridView?.backgroundColor = UIView.theme.backgroundColor
        self.gridView?.layer.borderColor = UIView.theme.lineColor.cgColor
        self.pickerView?.layer.borderColor = UIView.theme.lineColor.cgColor
        self.pickerView?.backgroundColor = UIView.theme.backgroundColor
        self.gridView?.layer.borderWidth = 1.0
        self.pickerView?.layer.borderWidth = 1.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyTheme()
        let pickerModel = PickerModel(objects: ["1w", "1m", "3m", "6m", "1y", "2y"])
        self.pickerView?.model = pickerModel
        let model = GridModel(horizontal: ["1","2","3"], vertical: ["a", "b", "c", "d", "e", "f", "g"])
        self.gridView?.model = model
    }

}

