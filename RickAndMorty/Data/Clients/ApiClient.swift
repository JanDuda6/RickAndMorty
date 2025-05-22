//
//  ApiClient.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import Dependencies

struct ApiClient: DependencyKey {
    var fetchCharactersResponse: @Sendable (String?) async throws -> CharactersResponse?
    var fetchEpsiode: @Sendable (String?) async throws -> Episode?

    static var liveValue: Self {
        return ApiClient(
            fetchCharactersResponse: { next in
                let allCharacters = "https://rickandmortyapi.com/api/character"
                let data = try await ApiRequester().fetchResponse(url: next ?? allCharacters)
                let response: CharactersResponse? = Decoder().decode(from: data)
                return response
            }, fetchEpsiode: { url in
                let data = try await ApiRequester().fetchResponse(url: url)
                let response: Episode? = Decoder().decode(from: data)
                return response
            }
        )
    }
}

extension DependencyValues {
    var apiClient: ApiClient {
        get {
            self[ApiClient.self]
        } set {
            self[ApiClient.self] = newValue
        }
    }
}
