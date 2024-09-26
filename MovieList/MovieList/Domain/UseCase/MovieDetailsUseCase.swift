//
//  MovieDetailsUseCase.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

protocol MovieDetailsUseCase{
    func getMovies()async -> [MovieData]
    func getMovieDetails(id: Int)async -> MovieDetailsDisplay
    func insertFavorite(_: MovieDetailsDisplay)
}
