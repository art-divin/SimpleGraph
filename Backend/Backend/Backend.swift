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
        var data : [BondData] = []
        // TODO: put to data generator
        var dateComps = NSCalendar.current.dateComponents(in: TimeZone.current, from: Date())
        dateComps.day = 1
        data.append(BondDataImpl(bond: bond, date: dateComps.date!, value: 1.0))
        dateComps.day = 2
        data.append(BondDataImpl(bond: bond, date: dateComps.date!, value: 5.0))
        dateComps.day = 3
        data.append(BondDataImpl(bond: bond, date: dateComps.date!, value: 6.0))
        dateComps.day = 4
        data.append(BondDataImpl(bond: bond, date: dateComps.date!, value: 2.0))
        dateComps.day = 5
        data.append(BondDataImpl(bond: bond, date: dateComps.date!, value: 3.0))
        dateComps.day = 6
        data.append(BondDataImpl(bond: bond, date: dateComps.date!, value: 5.0))
        dateComps.day = 7
        data.append(BondDataImpl(bond: bond, date: dateComps.date!, value: 12.0))
        DispatchQueue.main.async {
            completion(data)
        }
    }
    
}
