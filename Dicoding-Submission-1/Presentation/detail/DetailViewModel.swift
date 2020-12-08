//
//  DetailViewModel.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    @Published var loadingState: Bool = false
    @Published var errorMessage: String = ""
    @Published var game: GameModel? = nil
    let detailDmain: DetailDomain
    init(detailDmain: DetailDomain) {
        self.detailDmain = detailDmain
    }
    
    func getDetailGame(gameId: Int) {
        self.loadingState = true
        detailDmain.getDetailGame(gameId: gameId)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    case .finished:
                        self.loadingState = false
                }
            } receiveValue: { game in
                self.game = game
            }.store(in: &cancellables)

    }
}
