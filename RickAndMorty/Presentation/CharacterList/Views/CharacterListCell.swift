//
//  CharacterListCell.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import ComposableArchitecture
import SwiftUI

struct CharacterListCell: View {
    let character: Character
    var store: StoreOf<CharacterListReducer>

    var body: some View {
        NavigationLink {
            CharacterDetailsView(character: character)
        } label: {
            VStack(spacing: 10) {
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: character.image), transaction: Transaction(animation: .easeInOut)) { phase in
                        switch phase {
                        case let .success(image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .transition(.opacity)
                        default:
                            Image("placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .cornerRadius(10)
                    .scaledToFit()
                    .shadow(radius: 10)

                    Image(systemName: character.isFavorite ?? false ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding([.top, .leading], 10)
                        .foregroundColor(character.isFavorite ?? false ? .red : .white)
                        .shadow(radius: 3)
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)

                Text(character.name)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 10)
                    .lineLimit(1)
                    .shadow(radius: 4)
                    .padding(.horizontal, 5)
            }
            .background {
                LinearGradient(gradient:
                    Gradient(
                        colors: [Color.rickAndMortyGreen.opacity(0.4), Color.rickAndMortyGreen]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
            .cornerRadius(10)
        }
        .onAppear {
            store.send(.refresh)
        }
    }
}

#if DEBUG
    #Preview {
        let characters = [MockModels.character, MockModels.character, MockModels.character]
        let store = Store(
            initialState: CharacterListReducer.State(characters: characters, dataState: .loaded)) {
                CharacterListReducer()
            }
        CharacterListCell(character: MockModels.character, store: store).frame(width: UIScreen.main.bounds.width / 3)
    }
#endif
