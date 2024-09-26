//
//  MovieRepositoryImplementation.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

struct MovieRepositoryImplementation: MovieDetails {
    
    var dataSource: MovieAPI
    var dataPersistance: SwiftDataSource
    
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
    
    func getMovieDetails(id: Int) async -> MovieDetailsDisplay {
        var movieDetalis = await dataSource.fetchMovieDetails(id: id)
        var movieDetailDisplay = movieDataToPresentation(movieDetail: movieDetalis)
        return movieDetailDisplay
    }
    
    func movieDataToPresentation(movieDetail: MovieDetail?) -> MovieDetailsDisplay{
        var movieDetails = MovieDetailsDisplay(id: 0, posterPath: "", title: "", overview: "", releaseDate: "")
        guard let movieDetail = movieDetail else { return movieDetails}
        movieDetails = MovieDetailsDisplay(id: movieDetail.id, posterPath: movieDetail.posterPath, title: movieDetail.title, overview: movieDetail.overview, releaseDate: movieDetail.releaseDate)
        return movieDetails
    }
    
    func insertFavorite(movie: MovieDetailsDisplay) {
        let movieToSave = FavouriteMovie(id: movie.id, posterPath: movie.posterPath, title: movie.title, overview: movie.overview, releaseDate: movie.releaseDate)
        dataPersistance.insertMovieFavorite(movie: movieToSave)
    }
    
    
}
