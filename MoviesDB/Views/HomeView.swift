//
//  HomeView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct HomeView: View {
    private var showIndicator = false
    
    var body: some View {
        ScrollView {
            LazyHStack {
                Rectangle()
                    .frame(width: 250, height: 380)
                    .cornerRadius(16)
                    .padding(3)
                
            }
            
            CategoryScrollView(title: "Popular")
            CategoryScrollView(title: "Top Rated")
            CategoryScrollView(title: "Upcoming")
        }
    }
}

#Preview {
    HomeView()
}
