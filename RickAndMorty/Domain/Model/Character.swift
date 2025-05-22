//
//  Untitled.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import Foundation

struct Character: Codable, Equatable {
    let id: Int
    let name: String
    let status: String
    let gender: String
    let origin: LocationName
    let location: LocationName
    let image: String
    let episode: [String]

    init(id: Int, name: String, status: String, gender: String, origin: LocationName, location: LocationName, image: String, episode: [String]) {
        self.id = id
        self.name = name
        self.status = status
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
    }

    var isFavorite: Bool?
}

struct LocationName: Codable, Equatable {
    let name: String
}
