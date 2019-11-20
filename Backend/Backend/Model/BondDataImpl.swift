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
    var value: NSDecimalNumber
    var bond: Bond
    var amount : NSDecimalNumber
    
    required init(bond: Bond, date: Date, value: NSDecimalNumber, amount: NSDecimalNumber) {
        self.bond = bond
        self.date = date
        self.value = value
        self.amount = amount
    }
    
}
