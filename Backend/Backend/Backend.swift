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
        var data : [Bond] = []
        // TODO: put to data generator
        data.append(BondImpl(identifier: "asd-asd-asd-asd"))
        data.append(BondImpl(identifier: "def-egs-234-122"))
        data.append(BondImpl(identifier: "afe-4t4-asd-3gg"))
        data.append(BondImpl(identifier: "56y-32r-ad3-5y3"))
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
