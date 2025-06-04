//
//  CharacterTopImageView.swift
//  RickAndMorty
//
//  Created by Jan Duda on 20/05/2025.
//

import SwiftUI

struct CharacterTopImageView: View {
    let character: Character

    var body: some View {
        ZStack(alignment: .bottomLeading) {
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
            LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .bottom, endPoint: .top)
                .frame(height: 250)

            Text(character.name).font(.largeTitle).fontWeight(.bold)
                .padding(.bottom, 20)
                .padding(.horizontal, 16)
        }
    }
}

#if DEBUG
    #Preview {
        CharacterTopImageView(character: MockModels.character)
    }
#endif
