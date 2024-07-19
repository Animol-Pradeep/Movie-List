//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    var useCase: MovieDetailsUseCase
    
    @Published var movies: [MovieResults] = []
    
    init(useCase: MovieDetailsUseCase){
        self.useCase = useCase
    }
    
    //API call
    func fetchMovies(){
        Task {
            var movieResponse = await useCase.getMovies()
            guard let movieResult = movieResponse else{ return }
            self.movies = movieResult.results
        }
    }
}
