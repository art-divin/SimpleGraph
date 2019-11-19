//
//  NSObject+Combiner.swift
//  solution_2_ralikhamov
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit
import Interfaces

extension NSObject {
    
    func provider<T>(by cls: T.Type) -> T? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.combiner?.provider(by: cls)
        }
        return nil
    }
    
}
