//
//  MovieRepository.swift
//  MovieList
//
//  Created by Animol on 19/07/24.
//

import Foundation

protocol MovieDetails{
    func getMovies()async -> Movies?
}
