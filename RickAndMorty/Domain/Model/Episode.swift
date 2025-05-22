//
//  Untitled.swift
//  RickAndMorty
//
//  Created by Jan Duda on 20/05/2025.
//

import Foundation

struct Episode: Codable, Equatable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]

    init(id: Int, name: String, airDate: String, episode: String, characters: [String]) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
    }

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case id, name, episode, characters
    }

    var episodeAndSeasonNumber: String {
        let split = episode.split(separator: "E")
        let seasonNumber = split.first?.replacingOccurrences(of: "S", with: "Season: ").replacingOccurrences(of: #"0"#, with: "", options: .regularExpression)
        let episodeNumber = split.last?.replacingOccurrences(of: "0(?=[1-9])", with: "", options: .regularExpression)
        return "Episode: \(episodeNumber ?? ""), \(seasonNumber ?? "")"
    }
}
