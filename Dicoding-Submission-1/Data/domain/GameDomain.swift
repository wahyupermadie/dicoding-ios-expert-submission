//
//  GameDomain.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Combine

protocol GameDomain {
    func getGames(search: String?) -> AnyPublisher<[GameModel], Error>
}

class GameDomainImpl: GameDomain {
    let gameRepository: GameRepository
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    func getGames(search: String?) -> AnyPublisher<[GameModel], Error> {
        return gameRepository.getGames(search: search)
    }
}
