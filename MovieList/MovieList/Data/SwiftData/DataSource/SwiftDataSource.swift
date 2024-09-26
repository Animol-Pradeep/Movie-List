//
//  SwiftDataSource.swift
//  MovieList
//
//  Created by Animol on 30/08/24.
//

import Foundation
import SwiftUI
import SwiftData

class SwiftDataSource {
    var context : ModelContext?
    var container: ModelContainer?
    
    init() {
        
        self.container = try? ModelContainer(for: FavouriteMovie.self)
        if let container = self.container {
            self.context =  ModelContext(container)
        }
        
    }
    func insertMovieFavorite(movie: FavouriteMovie){
        guard let context = self.context else { return }
        context.insert(movie)
        do{
            try context.save()
        } catch {
            print("Failed")
        }
    }
}
