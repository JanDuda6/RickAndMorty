//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by Jan Duda on 19/05/2025.
//

import ComposableArchitecture
import Dependencies
import SwiftUI

struct CharacterDetailsView: View {
    var store = Store(
        initialState: CharacterDetailReducer.State()) {
            CharacterDetailReducer()
        }

    let character: Character

    var body: some View {
        ScrollView(showsIndicators: false) {
            CharacterTopImageView(character: character)
            Spacer().padding(.bottom, 10)
            VStack(alignment: .leading) {
                DetailsListView(sectionTitle: "Details", detailsList: store.characterDetailsList)
                    .padding(.horizontal, 16)
                Spacer().padding(.bottom, 30)

                switch store.dataState {
                case .loading:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                case .error:
                    HStack {
                        Spacer()
                        ErrorView(action: {
                            character.episode.forEach { episode in
                                store.send(.fetchEpisode(episode))
                            }
                        })
                        Spacer()
                    }
                default:
                    CharacterEpisodesList(store: store)
                }
            }
            Spacer()
        }
        .padding(.bottom, 20)
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    store.send(.favoriteAction(character))
                } label: {
                    Image(systemName: (store.isFavorite ?? character.isFavorite ?? false) ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor((store.isFavorite ?? character.isFavorite ?? false) ? .red : .white)
                        .frame(width: 20, height: 20)
                        .shadow(radius: 3)
                }
            }
        }
        .onAppear {
            store.send(.fetchCharacterDetailsList(character))
            character.episode.forEach { episode in
                store.send(.fetchEpisode(episode))
            }
        }
    }
}

#if DEBUG
    #Preview {
        let store = Store(initialState: CharacterDetailReducer.State(characterDetailsList: MockModels.detailsList)) {
            CharacterDetailReducer()
        }
        CharacterDetailsView(store: store, character: MockModels.character)
    }
#endif
