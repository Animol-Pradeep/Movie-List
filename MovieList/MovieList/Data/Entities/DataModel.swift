//
//  DataModel.swift
//  MovieList
//
//  Created by Animol on 05/08/24.
//

import Foundation

struct Movies: Codable{
    let page: Int
    let results: [MovieResults]
}

struct MovieResults: Codable, Hashable{
    let id: Int
    let posterPath: String
    let title: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case posterPath = "poster_path"
        case title
    }
}
