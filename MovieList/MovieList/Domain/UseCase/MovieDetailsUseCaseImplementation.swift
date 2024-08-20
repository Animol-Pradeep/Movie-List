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
    
    func getMovieDetails(id: Int) async -> MovieDetailsDisplay {
        let movieDetail = await movieRepositoryImplementation.getMovieDetails(id: id)
        return movieDetail
    }
    
}
