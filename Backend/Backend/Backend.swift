//
//  Backend.swift
//  Backend
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Interfaces

public class Backend : BondProvider {
    
    public init() {
    }
    
    public func bonds(completion: @escaping ([Bond]) -> Void) {
        
    }
    
    public func bondData(_ bond: Bond, completion: @escaping ([BondData]) -> Void) {
    }
    
}
