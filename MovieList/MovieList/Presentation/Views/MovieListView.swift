//
//  MovieListView.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel: MovieListViewModel
    
    let colums: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Color.gray
                //LazyVGrid(columns: colums) {
                ScrollView {
                    VStack {
                        ForEach(viewModel.movies, id: \.self){ movie in
                            Button(action: {
                                
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .fill(.black)
                                    VStack{
                                        let url = URL(string: "https://image.tmdb.org/t/p/w185/\(movie.posterPath)")
                                        AsyncImage(url: url) { Image in
                                            Image
                                        } placeholder: {
                                            Image(systemName: "waveform")
                                        }
                                        Text(movie.title)
                                        Rectangle()
                                            .fill(.clear)
                                            .frame(height: 2)
                                    }
                                }
                                .clipShape(.rect(cornerRadius: 20))
                            })
                        }
                    }
                    .background(.clear)
                    //}
                }
                .onAppear{
                    viewModel.fetchMovies()
                }
                .padding()
                
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel(useCase: MovieDetailsUseCaseImplementation(movieRepositoryImplementation: MovieRepositoryImplementation(dataSource: MovieAPI()))))
}
