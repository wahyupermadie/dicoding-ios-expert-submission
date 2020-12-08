//
//  DetailGame.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import SwiftUI
import Resolver

struct DetailGame: View {
    @ObservedObject var viewModel: DetailViewModel
    let gameId: Int
    init(gameId: Int, viewModel: DetailViewModel) {
        self.gameId = gameId
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack {
            if self.viewModel.loadingState {
                ActivityIndicatorView()
            } else {
                Text(viewModel.game?.name ?? "")
            }
        }.onAppear(perform: {
            self.viewModel.getDetailGame(gameId: self.gameId)
        })
    }
}

struct DetailGame_Previews: PreviewProvider {
    static var previews: some View {
        DetailGame(gameId: 123, viewModel: Resolver.resolve())
    }
}
