//
//  MovieDetailsUseCase.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

struct MovieDetailsUseCase: MovieDetails {
    
    var movieRepositoryImplementation: MovieDetails
    
    func getMovies() async -> Movies? {
        let movies = await movieRepositoryImplementation.getMovies()
        return movies
    }
    
    
    
    
    
}
