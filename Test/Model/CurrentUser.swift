//
//  CurrentUser.swift
//  Test
//
//  Created by Aryan Sharma on 07/09/24.
//

import Foundation
import SwiftData

@Model
class CurrentUser {
    
    private(set) var name: String
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
    
    init(user: User) {
        self.name = user.name
        self.username = user.username
        self.password = user.password
        self.bookmarkedArticleIds = user.bookmarkedArticleIds
        self.starredArticleIds = user.starredArticleIds
    }
}
