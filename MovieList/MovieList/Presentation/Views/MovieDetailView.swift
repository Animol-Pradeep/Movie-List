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
                    ZStack {
//                        Color("Bg")
//                            .edgesIgnoringSafeArea(.all)
                        VStack {
                        let url = URL(string: "https://image.tmdb.org/t/p/w185/\(movieDetail.posterPath)")
                        
                            AsyncImage(url: url) { Image in
                                Image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Image(systemName: "waveform")
                            }
                            VStack {
                                Text(movieDetail.title)
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
    }
}

#Preview {
    MovieDetailView(detailViewModel: MovieDetailViewModel(movieId: 0, useCase: MovieDetailsUseCaseImplementation(movieRepositoryImplementation: MovieRepositoryImplementation(dataSource: MovieAPI()))))
}
