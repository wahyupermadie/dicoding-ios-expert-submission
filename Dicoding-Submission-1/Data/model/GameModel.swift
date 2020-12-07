//
//  GameModel.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation

struct GameModel {
    var id: Int
    var name: String
    var released: Date? = nil
    var backgroundImage: String = ""
    var rating: Double = 0.0
    var description: String = ""
    var playtime: Int = 0
}
