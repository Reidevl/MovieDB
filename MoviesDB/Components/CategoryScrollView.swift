//
//  CategoryScrollView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct CategoryScrollView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    PosterView()
                    PosterView()
                    PosterView()
                    PosterView()
                    PosterView()
                }
            }
            
        }
    }
}

#Preview {
    CategoryScrollView(title: "Popular")
}
