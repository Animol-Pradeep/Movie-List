//
//  MovieDetailViewModel.swift
//  MovieList
//
//  Created by Animol on 05/08/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject{
    var movieId: Int
    var useCase: MovieDetailsUseCase
    @Published var movieDetails: MovieDetailsDisplay?
    
    @Published var isFavorite: Bool = false
    
    init(movieId: Int, useCase: MovieDetailsUseCase) {
        self.movieId = movieId
        self.useCase = useCase
        self.getMovieDetails()
    }
    
    func getMovieDetails(){
        Task {
            self.movieDetails = await useCase.getMovieDetails(id: movieId)
        }
    }
}
