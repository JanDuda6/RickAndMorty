//
//  EpisodeDetailsView.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

import ComposableArchitecture
import SwiftUI

struct EpisodeDetailsView: View {
    let detailsList: [DetailsList]
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            DetailsListView(
                sectionTitle: "Episode Details",
                detailsList: detailsList
            )
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
        .navigationTitle(title)
    }
}

#if DEBUG
    #Preview {
        EpisodeDetailsView(detailsList: MockModels.detailsList, title: "Rixty Minutes")
    }
#endif
