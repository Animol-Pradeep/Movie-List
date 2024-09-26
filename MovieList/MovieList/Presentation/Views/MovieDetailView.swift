//
//  MovieListDetailView.swift
//  MovieList
//
//  Created by Animol on 02/08/24.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var detailViewModel: MovieDetailViewModel
    var body: some View {
        VStack {
            if let movieDetail = detailViewModel.movieDetails{
                VStack{
                    ZStack(alignment: .top) {
//                        Color("Bg")
//                            .edgesIgnoringSafeArea(.all)
                        VStack {
                        let url = URL(string: "https://image.tmdb.org/t/p/w185/\(movieDetail.posterPath)")
                        
                            AsyncImage(url: url) { Image in
                                Image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .containerRelativeFrame(.horizontal) { size, axis in
                                        size * 0.6
                                    }
                            } placeholder: {
                                Image(systemName: "waveform")
                            }
                            
                            VStack {
                                Text(movieDetail.title)
                                Image(systemName: detailViewModel.isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .aspectRatio(1, contentMode: .fit)
                                    .containerRelativeFrame(.horizontal) { size, _ in
                                        size * 0.15
                                    }
                                    .onTapGesture {
                                        detailViewModel.isFavorite.toggle()
                                    }
                                
                                Rectangle()
                                    .fill(.clear)
                                    .frame(height: 2)
                                HStack{
                                    Text(movieDetail.overview)
                                    
                                }
                            }
                        }
                    }
                }
            }else{
                ProgressView()
            }
        }
        .ignoresSafeArea()
        .containerRelativeFrame(.vertical, { size, _ in
            size
        })
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MovieDetailView(detailViewModel: MovieDetailViewModel(movieId: 128, useCase: MovieDetailsUseCaseImplementation(movieRepositoryImplementation: MovieRepositoryImplementation(dataSource: MovieAPI(), dataPersistance: SwiftDataSource()))))
}
