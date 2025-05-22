//
//  ModelMock.swift
//  RickAndMorty
//
//  Created by Jan Duda on 20/05/2025.
//

class MockModels {
    static let character = Character(
        id: 1,
        name: "Rick Sanchez",
        status: "Alive",
        gender: "Male",
        origin: LocationName(name: "Earth"),
        location: LocationName(name: "Earth"),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: []
    )

    static let episode = Episode(
        id: 1,
        name: "Pilot",
        airDate: "December 2, 2013",
        episode: "S03E20",
        characters: ["1", "2"]
    )

    static let detailsList = [
        DetailsList(icon: "cross", title: "Alive", subtitle: "Status", isClicable: false),
        DetailsList(icon: "person.fill", title: "Male", subtitle: "Gender", isClicable: false),
    ]
}
