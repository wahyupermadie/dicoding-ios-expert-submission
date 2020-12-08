//
//  FavoriteViewModel.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import Foundation
import Combine

class FavoriteViewModel: ObservableObject {
    private var cancelable: Set<AnyCancellable> = []
    @Published var games: [GameModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    private let favoriteDomain: FavoriteDomain
    init(favoriteDomain: FavoriteDomain) {
        self.favoriteDomain = favoriteDomain
    }
    
    func getFavorites(){
        self.isLoading = true
        self.favoriteDomain.getFavorite()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.isLoading = false
                }
            } receiveValue: { (games) in
                self.games = games
            }.store(in: &cancelable)
    }
}
