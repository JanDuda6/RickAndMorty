//
//  CharacterDetailsListReposytory.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

protocol DetailsListRepository {
    func getDetailsList() -> [DetailsList]
}

class CharacterDetailsListRepository: DetailsListRepository {
    private let character: Character

    init(character: Character) {
        self.character = character
    }

    func getDetailsList() -> [DetailsList] {
        [
            DetailsList(icon: "cross", title: character.status, subtitle: "Status", isClicable: false),
            DetailsList(icon: "person.fill", title: character.gender, subtitle: "Gender", isClicable: false),
            DetailsList(icon: "house", title: character.origin.name, subtitle: "Origin", isClicable: false),
            DetailsList(icon: "globe.europe.africa", title: character.location.name, subtitle: "Location", isClicable: false),
        ]
    }
}
