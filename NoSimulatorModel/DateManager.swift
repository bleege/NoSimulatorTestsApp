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
    
    private let dateFacotry: DateFactory
    
    public init(dateFacotry: DateFactory = DefaultDateFactory()) {
        self.dateFacotry = dateFacotry
    }
    
    public func now() -> Date {
        return dateFacotry.now()
    }
}

