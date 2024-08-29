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
            Text("Wishlist")
                .tabItem {
                    Image(systemName: "heart.fill")
                }
        }
        .onAppear{
            UITabBar.appearance().backgroundColor = .gray
            UITabBar.appearance().unselectedItemTintColor = .white
        }
        
    }
}

#Preview {
    HomeTabView(viewModel: MovieListViewModel(useCase: MovieDetailsUseCaseImplementation(movieRepositoryImplementation: MovieRepositoryImplementation(dataSource: MovieAPI()))))
}
