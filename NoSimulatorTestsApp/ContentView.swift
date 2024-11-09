//
//  ContentView.swift
//  NoSimulatorTestsApp
//
//  Created by Brad Leege on 11/8/24.
//

import SwiftUI

protocol ContenViewModel: ObservableObject {
    var dateText: String { get }
    
    func handleNowButtonTapped()
}


struct ContentView<Model: ContenViewModel>: View {
    @StateObject var model: Model

    var body: some View {
        VStack {
            Text(model.dateText)
                .padding(.bottom, 28)
            Button("Now") {
                model.handleNowButtonTapped()
            }
        }
        .padding()
    }
}

#if DEBUG || DEBUG_SIMULATOR

class ContentViewModelMock: ContenViewModel {
    @Published var dateText: String = "Start"
    
    func handleNowButtonTapped() {
        dateText = Date().description
    }
}


#Preview {
    ContentView(
        model: ContentViewModelMock()
    )
}

#endif
