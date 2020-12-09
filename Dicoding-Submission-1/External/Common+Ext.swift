//
//  Common+Ext.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import SwiftUI

extension String {
    func convertToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)!
        return date
    }
}

extension Date {
    func convertToString(format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension Image {
    static let icCalendar: Image = Image(systemName: "calendar")
    static let icTimer: Image = Image(systemName: "timer")
    static let icFavorite: Image = Image(systemName: "heart")
    static let icFavoriteFilled: Image = Image(systemName: "heart.fill")
    static let icSearch: Image = Image(systemName: "magnifyingglass")
    static let icHome: Image = Image(systemName: "house.fill")
    static let icStar: Image = Image(systemName: "star.fill")
    static let icPerson: Image = Image(systemName: "person.fill")    
}
