//
//  DependencyComponent.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Resolver


extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerNetworkService()
    }
    
    public static func registerNetworkService() {
        register {
            URL(string: "https://api.rawg.io/api/")!
        }
        
        register {
            GameRepositoryImpl(baseUrl: resolve()) as GameRepository
        }
    }
}
