//
//  FavoriteDomain.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import Foundation
import Combine

protocol FavoriteDomain {
    func getFavorite() -> AnyPublisher<[GameModel], Error>
}

class FavoriteDomainImpl: FavoriteDomain {
    let repository: GameRepository
    init(repository: GameRepository) {
        self.repository = repository
    }
    func getFavorite() -> AnyPublisher<[GameModel], Error> {
        return repository.getFavorites()
    }
}
