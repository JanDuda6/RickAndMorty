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
            fetchCharacterDetailsList: { getDetailsList(character: $0) },
            fetchEpisodeDetailsList: { getEpisodeDetailsList(episode: $0) }
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

extension DetailsListRepositoryClient {
    static func getDetailsList(character: Character) -> [DetailsList] {
        [
            DetailsList(icon: "cross", title: character.status, subtitle: "Status", isClicable: false),
            DetailsList(icon: "person.fill", title: character.gender, subtitle: "Gender", isClicable: false),
            DetailsList(icon: "house", title: character.origin.name, subtitle: "Origin", isClicable: false),
            DetailsList(icon: "globe.europe.africa", title: character.location.name, subtitle: "Location", isClicable: false),
        ]
    }

    static func getEpisodeDetailsList(episode: Episode) -> [DetailsList] {
        [
            DetailsList(icon: "movieclapper", title: episode.name, subtitle: "Title", isClicable: false),
            DetailsList(icon: "calendar", title: episode.airDate, subtitle: "Air Date", isClicable: false),
            DetailsList(icon: "info.bubble.fill", title: episode.episodeAndSeasonNumber, subtitle: "Episode and Season", isClicable: false),
            DetailsList(icon: "person.fill", title: String(episode.characters.count), subtitle: "Characters count", isClicable: false),
        ]
    }
}
