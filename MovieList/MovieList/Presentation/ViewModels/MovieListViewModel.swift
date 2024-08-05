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
    
    init(useCase: MovieDetailsUseCase){
        self.useCase = useCase
    }
    
    //API call
    func fetchMovies(){
        Task {
            var movieResponse = await useCase.getMovies()
            self.movies = movieResponse
        }
    }
}
