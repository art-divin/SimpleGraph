//
//  IntTimePeriodTests.swift
//  BackendTests
//
//  Created by Ruslan Alikhamov on 20/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import XCTest
@testable import Backend

class IntTimePeriodTests: XCTestCase {
    
    func testTimePeriodOneWeek() {
        let days = 7
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertEqual(timePeriod, .some(.oneWeek))
    }
    
    func testTimePeriodNotTwoWeeks() {
        let days = 7
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertNotEqual(timePeriod, .some(.twoWeeks))
    }
    
    func testTimePeriodTwoWeeks() {
        let days = 14
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertEqual(timePeriod, .some(.twoWeeks))
    }
    
    func testTimePeriodThreeMonths() {
        let days = 90
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertEqual(timePeriod, .some(.threeMonths))
    }
    
    func testTimePeriodSixMonths() {
        let days = 180
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertEqual(timePeriod, .some(.sixMonths))
    }
    
    func testTimePeriodOneYear() {
        let days = 365
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertEqual(timePeriod, .some(.oneYear))
    }
    
    func testTimePeriodTwoYears() {
        let days = 730
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertEqual(timePeriod, .some(.twoYears))
    }
    
    func testTimePeriodOneMonth() {
        let days = 30
        let timePeriod = Int.TimePeriod(rawValue: days)
        XCTAssertEqual(timePeriod, .some(.oneMonth))
    }

}
