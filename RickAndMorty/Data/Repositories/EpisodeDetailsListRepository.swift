//
//  Untitled.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//
import Foundation
class EpisodeDetailsListRepository: DetailsListRepository {
    private let episode: Episode

    init(episode: Episode) {
        self.episode = episode
    }

    func getDetailsList() -> [DetailsList] {
        [
            DetailsList(icon: "movieclapper", title: episode.name, subtitle: "Title", isClicable: false),
            DetailsList(icon: "calendar", title: episode.airDate, subtitle: "Air Date", isClicable: false),
            DetailsList(icon: "info.bubble.fill", title: episode.episodeAndSeasonNumber, subtitle: "Episode and Season", isClicable: false),
            DetailsList(icon: "person.fill", title: String(episode.characters.count), subtitle: "Characters count", isClicable: false),
        ]
    }
}
