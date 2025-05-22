//
//  CharacterDetailCell.swift
//  RickAndMorty
//
//  Created by Jan Duda on 20/05/2025.
//

import ComposableArchitecture
import SwiftUI

struct DetailCell: View {
    let details: DetailsList

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: details.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.leading, 20)

            VStack(alignment: .leading) {
                if let title = details.title {
                    Text(title.capitalized)
                        .font(.system(size: 17, weight: .bold))
                }
                if let subtitle = details.subtitle {
                    Text(subtitle)
                        .font(.caption)
                }
            }
            Spacer()

            if details.isClicable {
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 20)
            }

        }.frame(height: 70)
            .background(Color.lightGray)
            .cornerRadius(20)
            .tint(.black)
    }
}

#Preview {
    DetailCell(details: MockModels.detailsList.first!)
}
