//
//  MovieRepositoryImplementation.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

struct MovieRepositoryImplementation: MovieDetails {
    
    var dataSource: MovieAPI
    
    func getMovies() async -> Movies? {
        let movies = await dataSource.fetchMovieList()
        return movies
    }
    
    
    
    
}
