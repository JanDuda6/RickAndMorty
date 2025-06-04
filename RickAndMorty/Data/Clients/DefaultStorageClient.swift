//
//  DefaultStorageClient.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

import Dependencies
import Foundation

struct DefaultStorageClient: DependencyKey {
    var favoriteAction: @Sendable (Character) -> Void
    var isFavorite: @Sendable (Character) -> Bool
    private static let key = "favorites"

    static var liveValue: Self {
        return DefaultStorageClient(
            favoriteAction: { favoriteAction(character: $0) },
            isFavorite: { isFavorite(character: $0) }
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

extension DefaultStorageClient {
    static func favoriteAction(character: Character) {
        var favorites = UserDefaults.standard.array(forKey: key) as? [String] ?? []
        if favorites.contains(where: { $0 == String(character.id) }), let index = favorites.firstIndex(of: String(character.id)) {
            favorites.remove(at: index)
        } else {
            favorites.append(String(character.id))
        }
        UserDefaults.standard.set(favorites, forKey: key)
    }

    static func isFavorite(character: Character) -> Bool {
        let favorites = UserDefaults.standard.array(forKey: key) as? [String] ?? []
        return favorites.contains(where: { $0 == String(character.id) })
    }
}
