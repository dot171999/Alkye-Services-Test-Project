//
//  DataStorage.swift
//  Test
//
//  Created by Aryan Sharma on 04/09/24.
//

import Foundation
import SwiftData

@Observable
class UserManager { 

    static let shared = UserManager()
    
    // Current User
    private(set) var currentUser: CurrentUser?
    
    
    func setCurrentUser(to user: User) -> CurrentUser {
        let currentUser = CurrentUser(user: user)
        self.currentUser = currentUser
        return currentUser
    }
    
    func setCurrentUser(equalTo user: CurrentUser) {
        self.currentUser = user
    }
    
    // Check if need to show onbaording.
    func isFirstLaunch() -> Bool {
        
        return false
    }
    // Check if a current user exists in DB.
    func check(forAny currentUser: [CurrentUser] ) -> Bool {
        if currentUser.isEmpty {
            return false
        }
        self.currentUser = currentUser.first
        return true
    }
    
    func logoutUser() {
        self.currentUser = nil
    }
    

   }
