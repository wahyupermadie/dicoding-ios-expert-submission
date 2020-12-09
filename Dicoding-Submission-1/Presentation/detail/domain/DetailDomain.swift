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
    let localDataSource: LocalDataSource
    init(localDataSource: LocalDataSource) {
        self.localDataSource = localDataSource
    }
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error> {
        return localDataSource.getDetailGame(gameId: gameId)
    }
    
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
        return localDataSource.setFavorite(id: id, isFavorite: isFavorite)
    }
}