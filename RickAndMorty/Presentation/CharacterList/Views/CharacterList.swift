//
//  CharacterList.swift
//  RickAndMorty
//
//  Created by Jan Duda on 19/05/2025.
//

import ComposableArchitecture
import SwiftUI

struct CharacterList: View {
    @StateObject var store: StoreOf<CharacterListReducer>
    let columns = [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)]

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(store.characters, id: \.id) { character in
                    CharacterListCell(character: character, store: store)
                        .onAppear {
                            if character == store.characters.last {
                                store.send(.fetchNextCharacters)
                            }
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Characters")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    store.send(.resetState)
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color.rickAndMortyGreen)
                        Text("Back")
                            .foregroundColor(Color.rickAndMortyGreen)
                    }
                }
            }
        }
    }
}

#Preview {
    let store = Store(
        initialState: CharacterListReducer.State()) {
            CharacterListReducer()
        }
    CharacterList(store: store)
}
