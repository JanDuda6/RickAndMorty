//
//  CharacterEpisodesList.swift
//  RickAndMorty
//
//  Created by Jan Duda on 20/05/2025.
//

import ComposableArchitecture
import SwiftUI

struct CharacterEpisodesList: View {
    @StateObject var store: StoreOf<CharacterDetailReducer>

    var body: some View {
        Section {
            ForEach(store.episodes, id: \.id) { episode in
                NavigationLink {
                    EpisodeDetailsView(detailsList: store.episodeDetailsList, title: episode.name)
                        .onAppear {
                            store.send(.fetchEpisodeDetailsList(episode))
                        }
                } label: {
                    let details = DetailsList(icon: "popcorn", title: episode.episodeAndSeasonNumber, subtitle: nil, isClicable: true)
                    DetailCell(details: details)
                }
            }
        } header: {
            Text("Episode List").font(.system(size: 20, weight: .bold))
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    let store = Store(initialState: CharacterDetailReducer.State(episodes: [MockModels.episode])) {
        CharacterDetailReducer()
    }
    CharacterEpisodesList(store: store)
}
