//
//  MoviesDBViewModel.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import Foundation

@Observable
class ApiViewModel {
    let apiKey: String = "3b86261ed6962c51aa694ab33f016c62"
    let apiUrl: String = "https://api.themoviedb.org/3/movie"
    
//    MARK: - Basic API's struct
    private func constructURL(endpoint: String) -> URL? {
        var urlComponents = URLComponents(string: "\(apiUrl)/\(endpoint)")
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        
        return urlComponents?.url
    }
    
    private func perfomRequest<T: Codable>(url: URL, responseType: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MDBError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodeResponse = try decoder.decode(responseType, from: data)
            return decodeResponse
            
        } catch {
            throw MDBError.invalidData
        }
    }
    
//    MARK: - Methods
    func getNowPlaying() async throws -> NowPlaying {
        
        guard let url = constructURL(endpoint: "now_playing") else {
            throw MDBError.invalidUrl
        }
        
        let nowPlaying = try await perfomRequest(url: url, responseType: NowPlaying.self)
        return nowPlaying
    }
    
    func getPopular() {
        
    }
    
    func getTopRated() {
        
    }
    
    func getUpcoming() {
        
    }
    
    func getMovieById(id: Int) {
        
    }
    
}

enum MDBError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
    
}
