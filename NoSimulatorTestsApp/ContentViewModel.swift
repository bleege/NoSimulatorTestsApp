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
    
    private let modelRepository: ModelRepository
    
    init(
        modelRepository: ModelRepository = DefaultModelRepository()
    ) {
        self.modelRepository = modelRepository
    }
    
    func handleNowButtonTapped() {
        do {
            try modelRepository.saveButtonTap()
        } catch {
            print("Error saving button tap: \(error.localizedDescription)")
        }
    }
}
