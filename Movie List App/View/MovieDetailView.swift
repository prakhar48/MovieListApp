//
//  MovieDetailView.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject private var viewModel: MovieListViewModel
    
    init(_ viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                
                Spacer().frame(height: 12.0)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Short Description")
                    
                    Text("djcjdbcjdbcjbdjbcdjb")
                }
                .padding(.horizontal, 20.0)
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Separator: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 2.0)
                .foregroundColor(.gray).opacity(0.15)
        }
    }
}
