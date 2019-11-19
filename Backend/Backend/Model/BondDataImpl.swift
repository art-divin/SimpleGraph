//
//  BondDataImpl.swift
//  Backend
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Interfaces

class BondDataImpl : BondData {
    
    var date: Date
    var value: Double
    var bond: Bond
    
    required init(bond: Bond, date: Date, value: Double) {
        self.bond = bond
        self.date = date
        self.value = value
    }
    
}
