//
//  Backend.swift
//  Backend
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Interfaces

public class Backend : BondProvider {
    
    private var generator = DataGenerator()
    
    public init() {
    }
    
    public func bonds(completion: @escaping ([Bond]) -> Void) {
        let data = self.generator.generateBonds()
        DispatchQueue.main.async {
            completion(data)
        }
    }
    
    public func bondData(_ bond: Bond, span: Int, completion: @escaping ([BondData]) -> Void) {
        let data = self.generator.generate(bond: bond, span: span)
        DispatchQueue.main.async {
            completion(data)
        }
    }
    
}
