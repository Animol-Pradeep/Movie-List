//
//  FavoritesView.swift
//  MovieList
//
//  Created by Animol on 30/08/24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query var movies: [FavouriteMovie]
    var body: some View {
        GeometryReader{_ in
            
        }
        .background(.blue)
    }
}

#Preview {
    FavoritesView()
}
