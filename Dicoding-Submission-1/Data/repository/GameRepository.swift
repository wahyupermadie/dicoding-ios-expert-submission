//
//  GameRepository.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Combine
import Alamofire

protocol GameRepository {
    func getGames(search: String?) -> AnyPublisher<[GameModel], Error>
    func getFavorites() -> AnyPublisher<[GameModel], Error>
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error>
    func setLocalData(games: [GameModel]) -> AnyPublisher<Bool, Error>
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error>
}

class GameRepositoryImpl: GameRepository {
    
    var remoteDataSource: RemoteDataSource
    var localDataSource: LocalDataSource
    init(remoteDataSource: RemoteDataSource, localDataSource: LocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    func getFavorites() -> AnyPublisher<[GameModel], Error> {
        return self.localDataSource.getFavorites()
            .map { game in
                game.mapToModel()
            }.eraseToAnyPublisher()
    }
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
        return self.localDataSource.setFavorite(id: id, isFavorite: isFavorite)
    }
    func setLocalData(games: [GameModel]) -> AnyPublisher<Bool, Error> {
        return self.localDataSource.setLocalData(games: games)
    }
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error> {
        return self.localDataSource.getDetailGame(gameId: gameId)
            .map {
                $0.convertObjectToModel()
            }.eraseToAnyPublisher()
    }
    func getGames(search: String?) -> AnyPublisher<[GameModel], Error> {
        return self.localDataSource.getLocalData(query: search)
            .flatMap { result -> AnyPublisher<[GameModel], Error> in
                if result.isEmpty {
                    return self.remoteDataSource.getGames(search: search)!
                        .map {
                            $0.mapToModel()
                        }.flatMap {
                            self.localDataSource.setLocalData(games: $0)
                        }.flatMap { _ in
                            self.localDataSource.getLocalData(query: search)
                        }.map {
                            $0.mapToModel()
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.localDataSource.getLocalData(query: search)
                        .map {
                            $0.mapToModel()
                        }.eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
