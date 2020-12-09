//
//  DependencyComponent.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Resolver
import RealmSwift

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerDataService()
        resgiterHomeService()
        registerDetailService()
        resgiterFavoriteService()
    }
    public static func registerDataService() {
        register {
            try! Realm()
        }
        
        register {
            LocalDataSourceImpl(realm: resolve()) as LocalDataSource
        }
        
        register {
            URL(string: "https://api.rawg.io/api/")!
        }
        
        register {
            RemoteDataSourceImpl(baseUrl: resolve()) as RemoteDataSource
        }
        
        register {
            GameRepositoryImpl(remoteDataSource: resolve(), localDataSource: resolve()) as GameRepository
        }
    }
}
