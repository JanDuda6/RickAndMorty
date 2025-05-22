//
//  DefaultStorageClient.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

import Dependencies

struct DefaultStorageClient: DependencyKey {
    var favoriteAction: @Sendable (Character) -> Void
    var isFavorite: @Sendable (Character) -> Bool

    static var liveValue: Self {
        return DefaultStorageClient(
            favoriteAction: { character in
                let repo = DefaultFavoriteRepository()
                repo.favoriteAction(character: character)
            }, isFavorite: { character in
                let repo = DefaultFavoriteRepository()
                return repo.isFavorite(character: character)
            }
        )
    }
}

extension DependencyValues {
    var defaultStorageClient: DefaultStorageClient {
        get {
            self[DefaultStorageClient.self]
        } set {
            self[DefaultStorageClient.self] = newValue
        }
    }
}
