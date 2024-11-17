//
//  CoreDataManagerTests.swift
//  NoSimulatorModelTests
//
//  Created by Brad Leege on 11/15/24.
//

import Testing
import NoSimulatorModel

struct CoreDataManagerTests {

    @Test func testSaveButtonTap() async throws {
        let testSubject = DefaultCoreDataManager(CoreDataContainer(true))
        
        #expect(throws: Never.self) {
            try testSubject.saveButtonTap(date: Date())
        }
        
    }
    
    @Test func testLoadAllButtonTaps() async throws {
        let testSubject = DefaultCoreDataManager(CoreDataContainer(true))
        
        let firstDateComponents = DateComponents(year: 2024, month: 7, day: 4)
        let firstDate = Calendar.current.date(from: firstDateComponents)!
        try testSubject.saveButtonTap(date: firstDate)
        
        let secondDateComponents = DateComponents(year: 2023, month: 4, day: 24)
        let secondDate = Calendar.current.date(from: secondDateComponents)!
        try testSubject.saveButtonTap(date: secondDate)

        let buttonTaps = try testSubject.loadAllButtonTaps()
        
        #expect(buttonTaps.count == 2)
        #expect(buttonTaps[0].dateTapped == secondDate)
        #expect(buttonTaps[1].dateTapped == firstDate)
    }

}
