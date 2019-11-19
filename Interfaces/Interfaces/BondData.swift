//
//  BondData.swift
//  Interfaces
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Foundation

public protocol BondData {
    
    var date : Date { get }
    var value : Double { get }
    var bond : Bond { get }
    
    init(bond: Bond, date: Date, value: Double)
    
}
