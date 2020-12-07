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
    let gameDomain: GameDomain
    init(gameDomain: GameDomain) {
        self.gameDomain = gameDomain
    }
    
    func getCategories() {
        gameDomain.getGames(search: nil)
          .receive(on: RunLoop.main)
          .sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
              self.errorMessage = String(describing: completion)
            case .finished:
              self.loadingState = false
            }
          }, receiveValue: { categories in
            
          })
          .store(in: &cancellables)
      }
}
