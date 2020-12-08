//
//  HomeView.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import SwiftUI
import Resolver

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                if self.viewModel.loadingState {
                    Text("Loading Bro")
                } else {
                    ForEach(self.viewModel.games, id: \.id) { game in
                        navigateToDetailPage(for: game.id) {
                            GameView(game: game)
                        }
                    }
                }
            }.onAppear(perform: {
                self.viewModel.getGames(name: nil)
            }).navigationTitle(Text("Games Catalogue"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: Resolver.resolve())
    }
}
