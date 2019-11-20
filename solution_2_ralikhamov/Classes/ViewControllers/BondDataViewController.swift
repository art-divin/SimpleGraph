//
//  BondDataViewController.swift
//  solution_2_ralikhamov
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit
import Drawable
import Interfaces

class BondDataViewController: UIViewController {

    @IBOutlet var gridView : GridView?
    @IBOutlet var pickerView : PickerView?
    @IBOutlet var dataButton : PickerButton?
    
    var bond : Bond? {
        didSet {
            if let selected = self.pickerView?.selectedData {
                self.loadData(span: selected)
            }
        }
    }
    var bondData : [BondData]? {
        didSet {
            self.reloadGraphView()
        }
    }
    
    func adjustDataButton() {
        guard let button = self.dataButton else {
            return
        }
        var text : String
        if button.isSelected {
            text = NSLocalizedString("price", comment: "switch to yield representation button title")
        } else {
            text = NSLocalizedString("yield", comment: "switch to amount representation button title")
        }
        button.setTitle(text, for: .normal)
    }
    
    func applyTheme() {
        let theme = ThemeBlue()
        UIView.theme = theme
        self.gridView?.backgroundColor = UIView.theme.backgroundColor
        self.gridView?.layer.borderColor = UIView.theme.systemLineColor.cgColor
        self.pickerView?.layer.borderColor = UIView.theme.systemLineColor.cgColor
        self.pickerView?.backgroundColor = UIView.theme.backgroundColor
        self.gridView?.layer.borderWidth = 1.0
        self.pickerView?.layer.borderWidth = 1.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyTheme()
        self.adjustDataButton()
        self.setupPickerView()
        self.loadData(span: self.pickerView?.selectedData ?? 0)
    }
    
    func setupPickerView() {
        let pickerModel = PickerModel(objects: [(7, "1w"), (14, "2w"), (90, "3m"), (180, "6m"), (365, "1y"), (730, "2y")])
        self.pickerView?.model = pickerModel
        self.pickerView?.delegate = self
    }
    
    func loadData(span: Int) {
        guard let provider = self.provider(by: BondProvider.self) else {
            fatalError("BondProvider is uninitialized!")
        }
        if let bond = self.bond {
            provider.bondData(bond, span: span) { objects in
                self.bondData = objects
            }
        }
    }

}

extension BondDataViewController {
    
    @IBAction func switchData(_ sender: PickerButton) {
        sender.isSelected = !sender.isSelected
        self.reloadGraphView()
        self.adjustDataButton()
    }
    
}

extension BondDataViewController {
    
    func reloadGraphView() {
        guard let bondData = self.bondData else {
            return
        }
        let model = GridModel(bondData: bondData, usesAmount: self.dataButton?.isSelected ?? false)
        self.gridView?.model = model
    }
    
}

extension BondDataViewController : PickerViewDelegate {
    
    func didChangeSelection(_ selected: Int) {
        self.loadData(span: selected)
    }
    
}

