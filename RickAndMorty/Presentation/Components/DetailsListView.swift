//
//  DataListView.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

import SwiftUI

struct DetailsListView: View {
    let sectionTitle: String
    let detailsList: [DetailsList]

    var body: some View {
        Section {
            ForEach(detailsList, id: \.self) { detail in
                DetailCell(details: detail)
            }
        } header: {
            Text(sectionTitle).font(.system(size: 20, weight: .bold))
        }
    }
}

#Preview {
    DetailsListView(sectionTitle: "Details", detailsList: MockModels.detailsList)
}
