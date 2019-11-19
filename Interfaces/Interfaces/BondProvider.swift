//
//  BondProvider.swift
//  Interfaces
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Foundation

public protocol BondProvider {
    
    func bonds(completion: @escaping ([Bond]) -> Void)
    func bondData(_ bond: Bond, completion: @escaping ([BondData]) -> Void)
    
}
