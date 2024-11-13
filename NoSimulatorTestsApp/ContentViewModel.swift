//
//  ContentViewModel.swift
//  NoSimulatorTestsApp
//
//  Created by Brad Leege on 11/8/24.
//

import Foundation
import NoSimulatorModel

class DefaultContentViewModel: ContenViewModel {
    @Published var dateText: String = "No Time Set"
    
    let coreDataManager: CoreDataManager
    let dateManager: DateManager
    
    init(
        coreDataManager: CoreDataManager = DefaultCoreDataManager(),
        dateManager: DateManager = DefaultDateManager()
    ) {
        self.coreDataManager = coreDataManager
        self.dateManager = dateManager
    }
    
    func handleNowButtonTapped() {
        let now = dateManager.now()
        dateText = now.description
        coreDataManager.saveButtonTap(date: now)
    }
}
