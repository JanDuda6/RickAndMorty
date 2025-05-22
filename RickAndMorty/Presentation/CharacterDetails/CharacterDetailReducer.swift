//
//  CharacterDetailReducer.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//
import ComposableArchitecture

@Reducer
struct CharacterDetailReducer: Reducer {
    @ObservableState
    struct State {
        var episodes: [Episode]
        var characterDetailsList: [DetailsList]
        var episodeDetailsList: [DetailsList]
        var isFavorite: Bool?
        var dataState: DataState = .loading

        init(episodes: [Episode] = [], characterDetailsList: [DetailsList] = [], episodeDetailsList: [DetailsList] = [], isFavorite: Bool? = nil) {
            self.episodes = episodes
            self.characterDetailsList = characterDetailsList
            self.episodeDetailsList = episodeDetailsList
            self.isFavorite = isFavorite
        }
    }

    enum Action: Equatable {
        case fetchEpisode(String)
        case fetchCharacterDetailsList(Character)
        case fetchEpisodeDetailsList(Episode)
        case taskFetchEpisode(Episode?)
        case favoriteAction(Character)
        case error
    }

    @Dependency(\.apiClient) private var apiClient
    @Dependency(\.detailsListRepositoryClient) private var detailsListRepositoryClient
    @Dependency(\.defaultStorageClient) private var storage

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .fetchEpisode(episodeUrl):
                guard state.episodes.isEmpty else { return .none }
                state.dataState = .loading
                return .run { send in
                    do {
                        let episode = try await apiClient.fetchEpsiode(episodeUrl)
                        await send(.taskFetchEpisode(episode))
                    } catch {
                        await send(.error)
                    }
                }
            case let .taskFetchEpisode(episode):
                guard let episode else { return .none }
                state.episodes.append(episode)
                state.episodes.sort {
                    $0.id < $1.id
                }
                state.dataState = .loaded
                return .none
            case let .fetchCharacterDetailsList(character):
                state.characterDetailsList = detailsListRepositoryClient.fetchCharacterDetailsList(character)
                return .none
            case let .fetchEpisodeDetailsList(episode):
                state.episodeDetailsList = detailsListRepositoryClient.fetchEpisodeDetailsList(episode)
                return .none
            case let .favoriteAction(character):
                storage.favoriteAction(character)
                state.isFavorite = storage.isFavorite(character)
                return .none
            case .error:
                state.dataState = .error
                return .none
            }
        }
    }
}
