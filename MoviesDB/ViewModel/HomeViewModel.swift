//
//  MovieDBViewModel.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import Foundation

@Observable
class HomeViewModel {
    var nowPlaying: [MovieResult]?
    var popular: [MovieResult]?
    var topRated: [MovieResult]?
    var upcoming: [MovieResult]?
    var isLoading = true
    
    private var apiViewModel = ApiViewModel()
    
    func fetchData() async {
        isLoading = true
        do {
            nowPlaying = try await apiViewModel.getNowPlaying().results
            popular = try await apiViewModel.getPopular().results
            topRated = try await apiViewModel.getTopRated().results
            upcoming = try await apiViewModel.getUpcoming().results
        } catch MDBError.invalidUrl {
            setNilData()
            print("Invalid URL")
        } catch MDBError.invalidResponse {
            setNilData()
            print("Invalid Response")
        } catch MDBError.invalidData {
            setNilData()
            print("Invalid Data")
        } catch {
            setNilData()
            print("Unexpected error: \(error.localizedDescription)")
        }
        isLoading = false
    }
    
    private func setNilData () {
        nowPlaying = nil
        popular = nil
        topRated = nil
        upcoming = nil
    }
}
