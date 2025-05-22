//
//  CharacterListReducer.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import ComposableArchitecture

enum DataState {
    case idle
    case loaded
    case loading
    case error
}

@Reducer
struct CharacterListReducer: Reducer {
    @ObservableState
    struct State: Equatable {
        var characters: [Character]
        var dataState: DataState
        var charactersResponse: CharactersResponse?

        init(characters: [Character] = [], dataState: DataState = .idle, charactersResponse: CharactersResponse? = nil) {
            self.characters = characters
            self.dataState = dataState
            self.charactersResponse = charactersResponse
        }
    }

    enum Action: Equatable {
        case fetchCharacters
        case taskFetchedCharacters(CharactersResponse?)
        case error
        case resetState
        case refresh
        case fetchNextCharacters
    }

    @Dependency(\.apiClient) private var apiClient
    @Dependency(\.defaultStorageClient) private var storage

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchCharacters:
                state.dataState = .loading
                return .run { send in
                    do {
                        let response = try await apiClient.fetchCharactersResponse(nil)
                        await send(.taskFetchedCharacters(response))
                    } catch {
                        await send(.error)
                    }
                }
            case .fetchNextCharacters:
                guard state.charactersResponse?.info.count != state.characters.count else { return .none }
                let nextUrl = state.charactersResponse?.info.next
                return .run { send in
                    do {
                        let response = try await apiClient.fetchCharactersResponse(nextUrl)
                        await send(.taskFetchedCharacters(response))
                    } catch {
                        await send(.error)
                    }
                }
            case let .taskFetchedCharacters(response):
                if let response {
                    state.charactersResponse = response
                    state.characters.append(contentsOf: response.results)
                    state.dataState = .loaded
                } else {
                    state.dataState = .error
                }
                return .none
            case .resetState:
                state.characters = []
                state.charactersResponse = nil
                state.dataState = .idle
                return .none
            case .error:
                state.dataState = .error
                return .none
            case .refresh:
                let updatedCharacters = state.characters.map { character in
                    var newCharacter = character
                    newCharacter.isFavorite = storage.isFavorite(newCharacter)
                    return newCharacter
                }
                state.characters = updatedCharacters
                return .none
            }
        }
    }
}
