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
    var isFavorite: Bool?
}

struct LocationName: Codable, Equatable {
    let name: String
}
