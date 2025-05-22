//
//  DateilsList.swift
//  RickAndMorty
//
//  Created by Jan Duda on 21/05/2025.
//

struct DetailsList: Hashable {
    var icon: String
    var title: String?
    var subtitle: String?
    var isClicable: Bool
    
    init(icon: String, title: String?, subtitle: String?, isClicable: Bool) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.isClicable = isClicable
    }
}
