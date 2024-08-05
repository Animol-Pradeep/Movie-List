//
//  MovieDetailsUseCaseImplementation.swift
//  MovieList
//
//  Created by Animol on 05/08/24.
//

import Foundation

struct MovieDetailsUseCaseImplementation: MovieDetailsUseCase {
    
    var movieRepositoryImplementation: MovieDetails
    
    func getMovies() async -> [MovieData] {
        let movies = await movieRepositoryImplementation.getMovies()
        return movies
    }
    
}
