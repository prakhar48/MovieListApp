//
//  SortOption.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

enum Sort {
    case title
    case releaseDate
}

struct SortOption: Hashable {
    
    let title: String
    let type: Sort
    
    internal init(title: String, type: Sort) {
        self.title = title
        self.type = type
    }
}
