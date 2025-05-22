//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import ComposableArchitecture
import SwiftUI

struct CharacterListView: View {
    @StateObject var store = Store(
        initialState: CharacterListReducer.State()) {
            CharacterListReducer()
        }

    var body: some View {
        ZStack {
            switch store.dataState {
            case .idle:
                WelcomeView(store: store)
            case .loaded:
                NavigationView {
                    CharacterList(store: store)
                }
                .accentColor(Color.rickAndMortyGreen)
                .navigationBarTitleDisplayMode(.inline)
            case .error:
                ErrorView(action: { store.send(.resetState) })
            case .loading:
                ProgressView()
            }
        }
    }
}

#Preview {
    let characters = [MockModels.character, MockModels.character, MockModels.character]
    let store = Store(
        initialState: CharacterListReducer.State(characters: characters, dataState: .loaded)) {
            CharacterListReducer()
        }
    CharacterListView(store: store)
}
