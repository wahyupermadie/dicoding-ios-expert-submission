//
//  DetailDomain.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import Foundation
import Combine

protocol DetailDomain {
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error>
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error>
}

class DetailDomainImpl: DetailDomain {
    let repository: GameRepository
    init(repository: GameRepository) {
        self.repository = repository
    }
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error> {
        return repository.getDetailGame(gameId: gameId)
    }
    
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
        return repository.setFavorite(id: id, isFavorite: isFavorite)
    }
}
