//
//  HomeView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct HomeView: View {
    @State private var hvm: HomeViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [hvm.backgroundColor, hvm.primaryColor, hvm.secondaryColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .animation(.easeOut(duration: 0.4), value: hvm.primaryColor)
                    .animation(.easeOut(duration: 0.4), value: hvm.secondaryColor)
                
                
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        ScrollView(.horizontal, showsIndicators: false) {
                            if hvm.isLoading {
                                ProgressView("Cargando...")
                            } else {
                                LazyHStack(spacing: 0) {
                                    Color.clear
                                        .frame(width: (UIScreen.main.bounds.width - 260) / 2, height: 400)
                                    ForEach(hvm.nowPlaying ?? [], id: \.id) { movie in
                                        GeometryReader { geometry in
                                            NavigationLink(destination: DetailView(movieId: movie.id)) {
                                                MainPosterView(movie: movie)
                                                    .frame(width: 260, height: 400)
                                                    .id(movie.id)
                                                    .task {
                                                        if hvm.isCentered(geometry: geometry) {
                                                            await hvm.updateBackgroundColors(for: movie)
                                                            
                                                            if hvm.centeredMovieId != movie.id {
                                                                hvm.centeredMovieId = movie.id
                                                                withAnimation {
                                                                    scrollViewProxy.scrollTo(movie.id, anchor: .center)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    .onChange(of: geometry.frame(in: .global)) {
                                                        if hvm.isCentered(geometry: geometry) {
                                                            if hvm.centeredMovieId != movie.id {
                                                                hvm.centeredMovieId = movie.id
                                                                Task {
                                                                    await hvm.updateBackgroundColors(for: movie)
                                                                }
                                                                withAnimation {
                                                                    scrollViewProxy.scrollTo(movie.id, anchor: .center)
                                                                }
                                                            }
                                                        }
                                                    }
                                            }
                                        }
                                        .frame(width: 260, height: 400)
                                    }
                                    Color.clear
                                        .frame(width: (UIScreen.main.bounds.width - 260) / 2, height: 400)
                                    
                                }
                            }
                        }
                        
                        CategoryScrollView(movies: hvm.popular, isLoading: hvm.isLoading, title: "Popular")
                        
                        CategoryScrollView(movies: hvm.topRated, isLoading: hvm.isLoading, title: "Top Rated")
                        
                        CategoryScrollView(movies: hvm.upcoming, isLoading: hvm.isLoading, title: "Upcoming")
                    }
                    .task {
                        await hvm.fetchData()
                    }
                }
            }
            .onChange(of: hvm.newPrimaryColor) {
                withAnimation(.easeIn(duration: 0.4)) {
                    hvm.backgroundColor = hvm.newBackgroundColor
                    hvm.primaryColor = hvm.newPrimaryColor
                    hvm.secondaryColor = hvm.newSecondaryColor
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
