//
//  HomeViewModel.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    @Published var loadingState: Bool = false
    @Published var errorMessage: String = ""
    @Published var games: [GameModel] = []
    let homeDomain: HomeDomain
    init(homeDomain: HomeDomain) {
        self.homeDomain = homeDomain
    }
    
    func getGames(name: String?) {
        self.loadingState = true
        homeDomain.getGames(search: name)
          .receive(on: RunLoop.main)
          .sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
              self.errorMessage = String(describing: completion)
            case .finished:
              self.loadingState = false
            }
          }, receiveValue: { games in
            self.games = games
          })
          .store(in: &cancellables)
      }
}
