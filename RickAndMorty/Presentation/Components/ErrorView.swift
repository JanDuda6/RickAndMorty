//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import SwiftUI

struct ErrorView: View {
    let action: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("Ups!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            Text("We are sorry but it seems that something goes wrong!")
                .font(.system(size: 17, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            Button("Try again") {
                action()
            }.frame(maxWidth: .infinity, maxHeight: 44)
                .tint(.white)
                .font(.system(size: 20, weight: .bold))

        }.padding(16)
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(Color.lightGray)
            .frame(alignment: .center)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

#Preview {
    ErrorView(action: {})
}
