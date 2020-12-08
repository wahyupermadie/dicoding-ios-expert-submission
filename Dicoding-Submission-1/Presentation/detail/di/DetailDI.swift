//
//  DetailDI.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import Foundation
import Resolver

extension Resolver {
    static func registerDetailService() {
        register {
            DetailDomainImpl(localDataSource: resolve()) as DetailDomain
        }
        
        register {
            DetailViewModel(detailDmain: resolve())
        }
    }
}
