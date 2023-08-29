//
//  Separator.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 29/08/23.
//

import SwiftUI

/// Adds divider with custom properties
struct Separator: View {
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer().frame(height: 20.0)
            
            Rectangle()
                .frame(height: 1.5)
                .foregroundColor(.gray).opacity(0.15)
            
            Spacer().frame(height: 20.0)
        }
    }
}
