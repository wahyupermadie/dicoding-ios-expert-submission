//
//  LocalDataSource.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import RealmSwift
import Combine

protocol LocalDataSource {
//    func getFavorite(id: String) -> AnyPublisher<Bool, Error>
//    func setFavorite(id: String) -> AnyPublisher<Bool, Error>
    func getLocalData(query: String?) -> AnyPublisher<[GameModel], Error>
    func setLocalData(games: [GameModel]) -> AnyPublisher<Bool, Error>
}

class LocalDataSourceImpl: LocalDataSource {
    let realm: Realm?
    init(realm: Realm) {
        self.realm = realm
    }
    
//    func getFavorite(id: String) -> AnyPublisher<Bool, Error> {
//
//    }
//
//    func setFavorite(id: String) -> AnyPublisher<Bool, Error> {
//        <#code#>
//    }
//
    func getLocalData(query: String?) -> AnyPublisher<[GameModel], Error> {
        return Future<[GameModel], Error> { completion in
            if let realm = self.realm {
                let games: Results<LocalGameEntity> = {
                    realm.objects(LocalGameEntity.self)
                }()
                let gamesData = games.toArray(ofType: LocalGameEntity.self).compactMap { (game) -> GameModel in
                    return GameModel(
                        id: game.id,
                        name: game.name,
                        released: game.released,
                        backgroundImage: game.backgroundImage!,
                        rating: game.rating,
                        description: game.desc,
                        playtime: game.playTime
                    )
                }
                completion(.success(gamesData))
            } else {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }

    func setLocalData(games: [GameModel]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for game in games {
                            let local = LocalGameEntity()
                            local.id = game.id
                            local.name = game.name
                            local.playTime = game.playtime
                            local.backgroundImage = game.backgroundImage
                            local.released = game.released
                            local.rating = game.rating
                            
                            realm.add(local, update: .all)
                        }
                        
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}
