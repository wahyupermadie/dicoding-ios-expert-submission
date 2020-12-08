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
}

class GameRepositoryImpl: GameRepository {
    var remoteDataSource: RemoteDataSource
    var localDataSource: LocalDataSource
    init(remoteDataSource: RemoteDataSource, localDataSource: LocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
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
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.localDataSource.getLocalData(query: search)
                              .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
