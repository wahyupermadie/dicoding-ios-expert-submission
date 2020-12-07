//
//  ErrorState.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation

enum DatabaseError: LocalizedError {
    case requestFailed
    case invalidInstance

    var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "Request failed"
        case .invalidInstance:
            return "Invalid database instance"
        }
    }
}
