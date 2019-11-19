//
//  Bond.swift
//  Interfaces
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Foundation

public protocol Bond {
    
    var identifier : String { get }
    
    init(identifier: String)
    
}
