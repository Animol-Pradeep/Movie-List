//
//  Movie.swift
//  MovieList
//
//  Created by Animol on 10/07/24.
//

import Foundation

struct MovieData: Hashable{
    let id: Int
    let posterPath: String
    let title: String
}

struct MovieDetailsDisplay{
    let id: Int
    let posterPath: String
    let title: String
    let overview: String
    let releaseDate: String
}
