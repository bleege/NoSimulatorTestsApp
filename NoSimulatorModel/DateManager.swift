//
//  DateManager.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/8/24.
//

import Foundation

public protocol DateManager {
    func now() -> Date
}

public class DefaultDateManager: DateManager {
    
    public init() {}
    
    public func now() -> Date {
        return Date()
    }
}

