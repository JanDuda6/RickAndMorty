//
//  CharactersResponse.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import Foundation

struct CharactersResponse: Codable, Equatable {
    let info: CharactesResponseInfo
    let results: [Character]
}

struct CharactesResponseInfo: Codable, Equatable {
    let next: String?
    let count: Int
}
