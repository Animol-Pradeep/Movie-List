//
//  DataModels.swift
//  MovieList
//
//  Created by Animol on 30/08/24.
//

import Foundation
import SwiftData

@Model
class FavouriteMovie {
    let id: Int
    let posterPath: String
    let title: String
    let overview: String
    let releaseDate: String
    var photo: Data?
    
    init(id: Int, posterPath: String, title: String, overview: String, releaseDate: String) {
        self.id = id
        self.posterPath = posterPath
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
    }
}
