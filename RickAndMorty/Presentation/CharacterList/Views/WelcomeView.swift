//
//  WelcomeView.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import ComposableArchitecture
import SwiftUI

struct WelcomeView: View {
    @StateObject var store: StoreOf<CharacterListReducer>

    var body: some View {
        ZStack {
            Image("portalImage")
                .resizable()
                .aspectRatio(contentMode: .fit)

            VStack(alignment: .center, spacing: 25) {
                Text("Wubba Lubba Dub Dub!!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 10)

                Text("To start exploring Rick and Morty world just tap on Rick")
                    .font(.system(size: 17, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .shadow(radius: 10)

                Button {
                    Task {
                        store.send(.fetchCharacters)
                    }
                } label: {
                    Image("rickHead")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                }
            }
            .padding(.horizontal, 50)
        }
    }
}

#Preview {
    let store = Store(
        initialState: CharacterListReducer.State()) {
            CharacterListReducer()
        }
    WelcomeView(store: store)
}
