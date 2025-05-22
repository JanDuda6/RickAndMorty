//
//  DetailsListRepository.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

import Dependencies
import Foundation

struct DetailsListRepositoryClient: DependencyKey {
    var fetchCharacterDetailsList: @Sendable (Character) -> [DetailsList]
    var fetchEpisodeDetailsList: @Sendable (Episode) -> [DetailsList]

    static var liveValue: Self {
        return DetailsListRepositoryClient(
            fetchCharacterDetailsList: { character in
                let repo = CharacterDetailsListRepository(character: character)
                return repo.getDetailsList()
            }, fetchEpisodeDetailsList: { episode in
                let repo = EpisodeDetailsListRepository(episode: episode)
                return repo.getDetailsList()
            }
        )
    }
}

extension DependencyValues {
    var detailsListRepositoryClient: DetailsListRepositoryClient {
        get {
            self[DetailsListRepositoryClient.self]
        } set {
            self[DetailsListRepositoryClient.self] = newValue
        }
    }
}
