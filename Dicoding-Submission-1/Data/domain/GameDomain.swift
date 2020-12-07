//
//  GameDomain.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Combine

protocol GameDomain {
    func getGames(search: String?) -> AnyPublisher<GameResponse, Error>
}

class GameDomainImpl: GameDomain {
    func getGames(search: String?) -> AnyPublisher<GameResponse, Error> {
        <#code#>
    }
}
