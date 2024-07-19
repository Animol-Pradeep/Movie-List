//
//  ContentView.swift
//  MovieList
//
//  Created by Animol on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    
    var dataSource: MovieAPI
    var movieDetail: MovieRepositoryImplementation
    var useCase: MovieDetailsUseCase
    var movieListViewModel: MovieListViewModel
    
    init() {
        self.dataSource = MovieAPI() // n/w call
        self.movieDetail = MovieRepositoryImplementation(dataSource: dataSource) // Repository implementation that fetch data from dataSource
        self.useCase = MovieDetailsUseCase(movieRepositoryImplementation: movieDetail) // calls repository implementation
        self.movieListViewModel = MovieListViewModel(useCase: useCase) // Viewmodel for the view
    }
    
    var body: some View {
        MovieListView(viewModel: self.movieListViewModel)
    }
}

#Preview {
    ContentView()
}
