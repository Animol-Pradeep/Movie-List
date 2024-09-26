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
    
    @MainActor
    init() {
        self.dataSource = MovieAPI() // n/w call
        self.movieDetail = MovieRepositoryImplementation(dataSource: dataSource, dataPersistance: SwiftDataSource()) // Repository implementation that fetch data from dataSource
        self.useCase = MovieDetailsUseCaseImplementation(movieRepositoryImplementation: movieDetail) // calls repository implementation
        self.movieListViewModel = MovieListViewModel(useCase: useCase) // Viewmodel for the view
    }
    
    var body: some View {
        NavigationStack {
            HomeTabView(viewModel: self.movieListViewModel)
        }
    }
}

#Preview {
    ContentView()
}
