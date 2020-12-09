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
                    ActivityIndicatorView()
                } else {
                    if self.viewModel.games.isEmpty {
                        VStack {
                            Spacer()
                            Image("empty_state")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 80)
                                .scaledToFit()
                                .clipped()
                            Text("Sepertinya tidak ada Game yang ditemukan")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                    } else {
                        ForEach(self.viewModel.games, id: \.id) { game in
                            navigateToDetailPage(for: game.id) {
                                GameView(game: game)
                            }
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
