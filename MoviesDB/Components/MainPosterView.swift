//
//  MainPosterView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct MainPosterView: View {
    var body: some View {
        Rectangle()
            .frame(width: 250, height: 380)
            .cornerRadius(16)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
    }
}

#Preview {
    MainPosterView()
}
