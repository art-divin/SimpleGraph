//
//  BondImpl.swift
//  Backend
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Interfaces

class BondImpl : Bond {
    
    var identifier: String
    
    required init(identifier: String) {
        self.identifier = identifier
    }
    
}
