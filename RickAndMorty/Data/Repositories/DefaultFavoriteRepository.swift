//
//  DefaultFavoriteRepository.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

import Foundation

protocol DefaultsStorage {
    func favoriteAction(character: Character)
    func isFavorite(character: Character) -> Bool
}

class DefaultFavoriteRepository: DefaultsStorage {
    private let key = "favorites"

    func favoriteAction(character: Character) {
        var favorites = UserDefaults.standard.array(forKey: key) as? [String] ?? []
        if favorites.contains(where: { $0 == String(character.id) }), let index = favorites.firstIndex(of: String(character.id)) {
            favorites.remove(at: index)
        } else {
            favorites.append(String(character.id))
        }
        UserDefaults.standard.set(favorites, forKey: key)
    }

    func isFavorite(character: Character) -> Bool {
        let favorites = UserDefaults.standard.array(forKey: key) as? [String] ?? []
        return favorites.contains(where: { $0 == String(character.id) })
    }
}
