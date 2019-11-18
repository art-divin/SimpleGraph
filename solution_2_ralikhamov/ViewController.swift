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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let model = GridModel(horizontal: ["1", "2", "3", "4"], vertical: ["a", "b", "c", "d", "e", "f"])
        self.gridView?.model = model
    }


}

