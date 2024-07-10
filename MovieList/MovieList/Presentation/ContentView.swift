//
//  ContentView.swift
//  MovieList
//
//  Created by Animol on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var movies: [MovieResults] = []
    
    var body: some View {
        List{
            ForEach(movies, id: \.self){ movie in
                HStack{
                    Text(movie.id.description)
                    Text("-")
                    Text(movie.title)
                    Text(movie.posterPath)
                }
                
            }
        }
        //API call
        .onAppear{
            Task{
                let movieResult = await MovieAPI().fetchMovieList()
                guard let movieResult = movieResult else{ return }
                self.movies = movieResult.results
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
