//
//  MovieRepositoryImplementation.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

struct MovieRepositoryImplementation: MovieDetails {
    
    var dataSource: MovieAPI
    
    func getMovies() async -> [MovieData] {
        let movies = await dataSource.fetchMovieList()
        let movieDatas = convertMovieToMovieData(movies: movies)
        return movieDatas
    }
    
    func convertMovieToMovieData(movies: Movies?) -> [MovieData]  {
        var movieDatas = [MovieData]()
        guard let movies = movies else { return movieDatas}
        let results = movies.results
        results.forEach { movie in
            let movieData = MovieData(id: movie.id, posterPath: movie.posterPath, title: movie.title)
            movieDatas.append(movieData)
        }
        return movieDatas
    }
    
    
    
    
}
