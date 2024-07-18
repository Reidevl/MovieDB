//
//  MovieDBViewModel.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import Foundation
import SwiftUI
import UIImageColors

@Observable
class HomeViewModel {
    var nowPlaying: [MovieResult]?
    var popular: [MovieResult]?
    var topRated: [MovieResult]?
    var upcoming: [MovieResult]?
    var movieDetail: MovieDetail?
    var movieCredit: Credits?
    var isLoading = true
    
    // color variables
    var primaryColor: Color = .black
    var secondaryColor: Color = .gray
    var backgroundColor: Color = .gray
    var newPrimaryColor: Color = .black
    var newSecondaryColor: Color = .gray
    var newBackgroundColor: Color = .gray
    var centeredMovieId: Int? = nil
    
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
    
    func getMovieById(movieId: Int) async {
        isLoading = true
        do {
            movieDetail = try await apiViewModel.getMovieById(movieId: movieId)
            movieCredit = try await apiViewModel.getMovieCredit(movieId: movieId)
        } catch MDBError.invalidUrl {
            print("Invalid URL")
        } catch MDBError.invalidResponse {
            print("Invalid Response")
        } catch MDBError.invalidData {
            print("Invalid Data")
        } catch {
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
    
    func isCentered(geometry: GeometryProxy) -> Bool {
        let frame = geometry.frame(in: .global)
        return abs(frame.midX - UIScreen.main.bounds.midX) < frame.width / 2
    }
    
    func updateBackgroundColors(for movie: MovieResult) async {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") else { return }
        let data = try? Data(contentsOf: url)
        if let imageData = data, let uiImage = UIImage(data: imageData) {
            let colors = uiImage.getColors()
            DispatchQueue.main.async {
                self.newBackgroundColor = Color(colors.background)
                self.newPrimaryColor = Color(colors.primary)
                self.newSecondaryColor = Color(colors.secondary)
            }
        }
    }
}
