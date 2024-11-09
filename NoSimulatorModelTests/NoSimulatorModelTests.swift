//
//  NoSimulatorModelTests.swift
//  NoSimulatorModelTests
//
//  Created by Brad Leege on 11/8/24.
//

import Testing
import NoSimulatorModel

struct NoSimulatorModelTests {

    @Test func testNowFunction() async throws {
        let dateFactory = DateFactoryMock()
        let date = Date()
        dateFactory.dateCallback = {
            date
        }
        
        let dateManager = DefaultDateManager(dateFacotry: dateFactory)
        
        #expect(dateManager.now() == date)
    }

}

extension NoSimulatorModelTests {
    class DateFactoryMock: DateFactory {
        var dateCallback: (() -> Date)?

        func now() -> Date {
            dateCallback!()
        }
    }
}
