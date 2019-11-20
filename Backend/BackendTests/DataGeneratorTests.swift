//
//  DataGeneratorTests.swift
//  BackendTests
//
//  Created by Ruslan Alikhamov on 20/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import XCTest
@testable import Backend

class DataGeneratorTests: XCTestCase {
    
    func testGenerateBondsForWeek() {
        let generator = DataGenerator()
        let bond = BondImpl(identifier: "test")
        let data = generator.generate(bond: bond, span: Int.TimePeriod.oneWeek.rawValue)
        XCTAssertEqual(data.count, 7)
    }
    
    func testGenerateBondsForThreeMonths() {
        let generator = DataGenerator()
        let bond = BondImpl(identifier: "test")
        let data = generator.generate(bond: bond, span: Int.TimePeriod.threeMonths.rawValue)
        XCTAssertEqual(data.count, 4)
    }
    
    func testGenerateBondsForSixMonths() {
        let generator = DataGenerator()
        let bond = BondImpl(identifier: "test")
        let data = generator.generate(bond: bond, span: Int.TimePeriod.sixMonths.rawValue)
        XCTAssertEqual(data.count, 7)
    }
    
    func testGenerateBondsForOneYear() {
        let generator = DataGenerator()
        let bond = BondImpl(identifier: "test")
        let data = generator.generate(bond: bond, span: Int.TimePeriod.oneYear.rawValue)
        XCTAssertEqual(data.count, 13)
    }
    
    func testGenerateBondsForTwoYears() {
        let generator = DataGenerator()
        let bond = BondImpl(identifier: "test")
        let data = generator.generate(bond: bond, span: Int.TimePeriod.twoYears.rawValue)
        XCTAssertEqual(data.count, 25)
    }

    func testGenerateBondsAtLeastOne() {
        let generator = DataGenerator()
        let bonds = generator.generateBonds()
        XCTAssertGreaterThanOrEqual(bonds.count, 1)
    }
    
}
