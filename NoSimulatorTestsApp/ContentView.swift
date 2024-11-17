//
//  ContentView.swift
//  NoSimulatorTestsApp
//
//  Created by Brad Leege on 11/8/24.
//

import SwiftUI

protocol ContenViewModel: ObservableObject {
    var buttonTaps: [ButtonTapData] { get }
    
    func handleNowButtonTapped()
}


struct ContentView<Model: ContenViewModel>: View {
    @StateObject var model: Model

    var body: some View {
        VStack {
            Button("Generate New Tap") {
                model.handleNowButtonTapped()
            }
            .buttonStyle(.borderedProminent)
            List(model.buttonTaps, id: \.id) { tap in
                VStack {
                    HStack {
                        Text(tap.id.uuidString)
                            .font(.caption)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text(tap.tapDate.formatted(.dateTime))
                            .font(.caption)
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .padding([.leading, .trailing], 0)
    }
}

#if DEBUG || DEBUG_SIMULATOR

class ContentViewModelMock: ContenViewModel {
    @Published var buttonTaps = [
        ButtonTapData(id: UUID(), tapDate: Date()),
        ButtonTapData(id: UUID(), tapDate: Date())
    ]
    
    func handleNowButtonTapped() { }
}

#Preview {
    ContentView(
        model: ContentViewModelMock()
    )
}

#endif
