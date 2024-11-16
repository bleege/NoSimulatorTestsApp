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

}
