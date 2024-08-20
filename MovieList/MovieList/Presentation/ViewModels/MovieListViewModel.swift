//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    
    var useCase: MovieDetailsUseCase
    
    @Published var movies: [MovieData] = []
    @Published var toDetailsScreen: Bool = false
    
    var detailViewModel: MovieDetailViewModel
    
    init(useCase: MovieDetailsUseCase){
        self.useCase = useCase
        self.detailViewModel = MovieDetailViewModel(movieId: 0, useCase: useCase)
    }
    
    //API call
    func fetchMovies(){
        Task {
            var movieResponse = await useCase.getMovies()
            self.movies = movieResponse
        }
    }
    
    func moveToDetailsScreen(movieId: Int){
        detailViewModel = MovieDetailViewModel(movieId: movieId, useCase: useCase)
        toDetailsScreen.toggle() // toDetailsScreen = true
    }
}
