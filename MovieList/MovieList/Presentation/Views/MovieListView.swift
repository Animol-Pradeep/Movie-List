//
//  MovieListView.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel: MovieListViewModel
    
    var body: some View {
            List{
                VStack {
                    ForEach(viewModel.movies, id: \.self){ movie in
                        VStack{
                            let url = URL(string: "https://image.tmdb.org/t/p/w185/\(movie.posterPath)")
                            AsyncImage(url: url) { Image in
                                Image
                            } placeholder: {
                                Image(systemName: "waveform")
                            }
                            Text(movie.title)
                            Rectangle()
                                .frame(height: 2)
                        }
                        .border(.blue)
                    }
                }
            }
            .onAppear{
                viewModel.fetchMovies()
            }
            .padding()
        
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel(useCase: MovieDetailsUseCase(movieRepositoryImplementation: MovieRepositoryImplementation(dataSource: MovieAPI()))))
}
