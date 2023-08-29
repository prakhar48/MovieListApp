//
//  SortButtonView.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import SwiftUI

struct SortButtonView: View {
    @State private var showSortOptions: Bool = false
    private let delegate: MovieListProtocol
    private let options: [SortOption]
    
    init(delegate: MovieListProtocol, options: [SortOption]) {
        self.delegate = delegate
        self.options = options
    }
    
    var body: some View {
        Button {
            showSortOptions = true
        } label: {
            Text("Sort")
                .foregroundColor(.black)
        }
        .confirmationDialog("Select a category", isPresented: $showSortOptions, titleVisibility: .visible) {
            ForEach(options, id: \.self) { item in
                Button {
                    delegate.onSort(item.type)
                } label: {
                    Text(item.title)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
