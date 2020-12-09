//
//  ContentView.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import SwiftUI
import Resolver

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView(viewModel: Resolver.resolve())
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            FavoriteView(viewModel: Resolver.resolve())
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorite")
            }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
