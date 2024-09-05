//
//  User.swift
//  Test
//
//  Created by Aryan Sharma on 04/09/24.
//
import Foundation
import SwiftData

@Model
class User {
    var name: String
    @Attribute(.unique) private(set) var username: String
    private(set) var password: String
    var bookmarkedArticleIds: [Int]
    var starredArticleIds: [Int]
    
    init(name: String, username: String, password: String, bookmarkedArticleIds: [Int], starredArticleIds: [Int]) {
        self.name = name
        self.username = username
        self.password = password
        self.bookmarkedArticleIds = bookmarkedArticleIds
        self.starredArticleIds = starredArticleIds
    }
}
