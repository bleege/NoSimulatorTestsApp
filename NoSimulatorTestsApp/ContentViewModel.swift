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
    
    let dateManager: DateManager
    
    init(dateManager: DateManager = DefaultDateManager()) {
        self.dateManager = dateManager
    }
    
    func handleNowButtonTapped() {
        dateText = Date().description
    }
}
