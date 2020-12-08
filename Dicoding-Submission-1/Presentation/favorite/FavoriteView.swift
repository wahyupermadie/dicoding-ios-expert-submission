//
//  FavoriteView.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import SwiftUI
import Resolver

struct FavoriteView: View {
    @ObservedObject var viewModel: FavoriteViewModel
    init(viewModel: FavoriteViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                if self.viewModel.isLoading {
                    ActivityIndicatorView()
                } else {
                    if viewModel.games.isEmpty {
                        ForEach(self.viewModel.games, id: \.id) { game in
                            navigateToDetailPage(for: game.id) {
                                GameView(game: game)
                            }
                        }
                    } else {
                        VStack {
                            Spacer()
                            Image("empty_state")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 80)
                                .scaledToFit()
                                .clipped()
                            Text("Sepertinya anda belum menambahkan Game Favorite")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }.onAppear(perform: {
                self.viewModel.getFavorites()
            }).navigationTitle(Text("Favorite Games"))
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(viewModel: Resolver.resolve())
    }
}
