//
//  NowPlaying.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import Foundation

// MARK: - MovieDBResponse
struct MovieDBResponse: Codable {
    let page: Int
    let results: [MovieResult]
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable, Identifiable {
    let backdropPath: String
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
