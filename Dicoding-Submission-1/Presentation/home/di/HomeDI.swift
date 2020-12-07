//
//  HomeDI.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Resolver

extension Resolver {
    static func resgiterHomeService() {
        register {
            HomeViewModel(gameDomain: resolve())
        }
    }
}
