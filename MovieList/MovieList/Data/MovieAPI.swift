//
//  MovieAPI.swift
//  MovieList
//
//  Created by Animol on 10/07/24.
//

import Foundation

struct MovieAPI {
    func fetchMovieList() async -> Movies?{
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNTU3NzkyNTk5NmM1MGMyZTFkMTFhNDRjYzJhNmY0MSIsIm5iZiI6MTcyMDYwNDMwNi43NjA5MDUsInN1YiI6IjY2ODY4M2FlYzJjY2Y5Nzg0ZjI1OTg4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T_62Rgh6jhsfgkwxYDJ1hH5vqQG0DCdhqjcdbtD59ec"
        ]
        do{
            let (data, _) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode(Movies.self, from: data)
            return result
        }catch{
            print("error")
        }
        
        return nil
    }
}
