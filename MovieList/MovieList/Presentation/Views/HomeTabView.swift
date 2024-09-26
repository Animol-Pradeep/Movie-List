//
//  HomeTabView.swift
//  MovieList
//
//  Created by Animol on 26/08/24.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject var viewModel: MovieListViewModel
    var body: some View {
        TabView {
            MovieListView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                }
        }
        .tint(.red)
        .onAppear{
            UITabBar.appearance().barTintColor = .gray
            UITabBar.appearance().unselectedItemTintColor = .black
            UITabBar.appearance().backgroundColor = .gray
        }
        
    }
}

#Preview {
    HomeTabView(viewModel: MovieListViewModel(useCase: MovieDetailsUseCaseImplementation(movieRepositoryImplementation: MovieRepositoryImplementation(dataSource: MovieAPI(), dataPersistance: SwiftDataSource()))))
}
