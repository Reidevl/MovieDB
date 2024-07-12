//
//  HomeView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct HomeView: View {
    @State private var homeViewModel: HomeViewModel = .init()
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal, showsIndicators: false) {
                if homeViewModel.isLoading {
                    ProgressView("Cargando...")
                } else {
                    LazyHStack {
                        ForEach(homeViewModel.nowPlaying ?? []) { movie in
                            MainPosterView(movie: movie)
                                .onTapGesture {
                                    withAnimation {
                                        print(movie.title)                                        
                                    }
                                }
                        }
                    }
                }
            }
            
            CategoryScrollView(movies: homeViewModel.popular, isLoading: homeViewModel.isLoading, title: "Popular")
            
            CategoryScrollView(movies: homeViewModel.topRated, isLoading: homeViewModel.isLoading, title: "Top Rated")
            
            CategoryScrollView(movies: homeViewModel.upcoming, isLoading: homeViewModel.isLoading, title: "Upcoming")
        }
        .task{
            await homeViewModel.fetchData()
        }
    }
}

#Preview {
    HomeView()
}
