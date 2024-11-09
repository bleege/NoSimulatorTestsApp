//
//  ContentViewModel.swift
//  NoSimulatorTestsApp
//
//  Created by Brad Leege on 11/8/24.
//

import Foundation

class DefaultContentViewModel: ContenViewModel {
    @Published var dateText: String = "No Time Set"
    
    func handleNowButtonTapped() {
        dateText = Date().description
    }
}
