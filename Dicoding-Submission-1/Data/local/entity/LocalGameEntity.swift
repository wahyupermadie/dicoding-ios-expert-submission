//
//  LocalGameEntity.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import RealmSwift

class CategoryEntity: Object {

    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundImage: String? = ""
    @objc dynamic var playTime: Int = 0
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var released: Date? = nil
    override static func primaryKey() -> String? {
        return "id"
    }
 
}
