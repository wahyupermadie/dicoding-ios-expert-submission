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
    let localDataSource: LocalDataSource
    init(localDataSource: LocalDataSource) {
        self.localDataSource = localDataSource
    }
    func getFavorite() -> AnyPublisher<[GameModel], Error> {
        return localDataSource.getFavorites()
    }
}
