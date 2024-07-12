//
//  HomeView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct HomeView: View {
    @State private var apiViewModel: ApiViewModel = ApiViewModel()
    @State private var nowPlaying: [MovieResult]?
    
    private var showIndicator = false
    
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    MainPosterView()
                    MainPosterView()
                    MainPosterView()
                    MainPosterView()
                }
            }
            
            CategoryScrollView(title: "Popular")
            CategoryScrollView(title: "Top Rated")
            CategoryScrollView(title: "Upcoming")
        }
        .task{
            do {
                nowPlaying = try await apiViewModel.getNowPlaying().results
            } catch MDBError.invalidUrl {
                nowPlaying = nil
                print("Invalid Url")
            } catch MDBError.invalidResponse {
                nowPlaying = nil
                print("Invalid Response")
            } catch MDBError.invalidData {
                nowPlaying = nil
                print("Invalid Data")
            } catch {
                print("Unexpected error: \(error.localizedDescription)")
            }
        }
    }
    

}

#Preview {
    HomeView()
}
