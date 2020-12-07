//
//  ObjMapper+Ext.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import RealmSwift

extension Array where Element == Game {
    func mapToModel() -> [GameModel] {
        self.map { (game) in
            return GameModel(
                id: game.id ?? 0,
                name: game.name ?? "",
                released: game.released,
                backgroundImage: game.backgroundImage ?? "",
                rating: game.rating ?? 0.0,
                description: game.description ?? "",
                playtime: game.playtime ?? 0
            )
        }
    }
}

func mapCategoryResponsesToEntities(
  input categoryResponses: GameResponse
) -> [GameModel] {
    return categoryResponses.results.map { game in
        return GameModel(
            id: game.id ?? 0,
            name: game.name ?? "",
            released: game.released,
            backgroundImage: game.backgroundImage ?? "",
            rating: game.rating ?? 0.0,
            description: game.description ?? "",
            playtime: game.playtime ?? 0
        )
  }
}

extension GameResponse {
    func mapToModel() -> [GameModel] {
        self.results.map { (game) in
            return GameModel(
                id: game.id ?? 0,
                name: game.name ?? "",
                released: game.released,
                backgroundImage: game.backgroundImage ?? "",
                rating: game.rating ?? 0.0,
                description: game.description ?? "",
                playtime: game.playtime ?? 0
            )
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array: [T] = []
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
