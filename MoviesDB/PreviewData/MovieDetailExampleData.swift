//
//  MovieDetailExampleData.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 18/7/24.
//

import Foundation

struct MovieDetailExampleData {
    static let movieDetailExample: MovieDetail =
    MovieDetail(
        adult: false,
        backdropPath: "/xg27NrXi7VXCGUr7MG75UqLl6Vg.jpg",
        belongsToCollection: BelongsToCollection(
            id: 1022790,
            name: "Inside Out Collection",
            posterPath: "/Apr19lGxP7gm6y2HQX0kqOXTtqC.jpg",
            backdropPath: "/7U2m2dMSIfHx2gWXKq78Xj1weuH.jpg"
        ),
        budget: 200000000,
        genres: [
            Genre(id: 16, name: "Animation"),
            Genre(id: 10751, name: "Family"),
            Genre(id: 12, name: "Adventure"),
            Genre(id: 35, name: "Comedy")
        ],
        homepage: "https://movies.disney.com/inside-out-2",
        id: 1022789,
        imdbID: "tt22022452",
        originCountry: ["US"],
        originalLanguage: "en",
        originalTitle: "Inside Out 2",
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
        popularity: 5389.964,
        posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
        productionCompanies: [
            ProductionCompany(id: 2, logoPath: "/wdrCwmRnLFJhEoH8GSfymY85KHT.png", name: "Walt Disney Pictures", originCountry: "US"),
            ProductionCompany(id: 3, logoPath: "/1TjvGVDMYsj6JBxOAkUHpPEwLf7.png", name: "Pixar", originCountry: "US")
        ],
        productionCountries: [
            ProductionCountry(iso3166_1: "US", name: "United States of America")
        ],
        releaseDate: "2024-06-11",
        revenue: 1350092077,
        runtime: 97,
        spokenLanguages: [
            SpokenLanguage(englishName: "English", iso639_1: "en", name: "English")
        ],
        status: "Released",
        tagline: "Make room for new emotions.",
        title: "Inside Out 2",
        video: false,
        voteAverage: 7.701,
        voteCount: 1879
    )
    
}
