//
//  DataGenerator.swift
//  Backend
//
//  Created by Ruslan Alikhamov on 20/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Interfaces

class DataGenerator {
    
    func generateBonds() -> [Bond] {
        var data : [Bond] = []
        for _ in 1 ... Int.random(in: 2 ... 20) {
            data.append(BondImpl(identifier: NSUUID().uuidString))
        }
        return data
    }
    
    func generate(bond: Bond, span: Int) -> [BondData] {
        var data : [BondData] = []
        let calendar = NSCalendar.current
        for idx in 1 ... span {
            var dateComps = calendar.dateComponents(in: TimeZone.current, from: Date())
            switch span.period {
            case .oneWeek:
                fallthrough
            case .twoWeeks:
                dateComps.day = idx
            case .threeMonths:
                fallthrough
            case .sixMonths:
                fallthrough
            case .oneYear:
                fallthrough
            case .twoYears:
                dateComps.day = 1
                let month = Int(Float(idx / (Int.TimePeriod.oneMonth.rawValue)))
                let newMonth = dateComps.month! + month
                dateComps.month = newMonth
                let newDate = dateComps.date!
                let existingComps = data.compactMap({ calendar.dateComponents([.month, .year], from: $0.date) })
                let newComps = calendar.dateComponents([.month, .year], from: newDate)
                if existingComps.first(where: { $0.month == newComps.month && $0.year == newComps.year }) != nil {
                    continue
                }
                dateComps.month = newMonth
            case .oneMonth: fallthrough
            case .none:
                dateComps.day = idx
            }
            let value = NSDecimalNumber(floatLiteral: Double.random(in: 0 ..< 100))
            let amount = NSDecimalNumber(floatLiteral: Double.random(in: 100 ..< 400))
            let resultDate = dateComps.date!
            let bondData = BondDataImpl(bond: bond, date: resultDate, value: value, amount: amount)
            data.append(bondData)
        }
        return data
    }
    
}

extension Int {
    
    enum TimePeriod : Int {
        case oneWeek = 7
        case twoWeeks = 14
        case threeMonths = 90
        case sixMonths = 180
        case oneYear = 365
        case twoYears = 730
        case oneMonth = 30
    }
    
    var period : TimePeriod? {
        return TimePeriod(rawValue: self)
    }
    
}

