//
//  FavoriteDI.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import Foundation
import Resolver

extension Resolver {
    static func resgiterFavoriteService() {
        register {
            FavoriteDomainImpl(localDataSource: resolve()) as FavoriteDomain
        }
        
        register {
            FavoriteViewModel(favoriteDomain: resolve())
        }
    }
}
