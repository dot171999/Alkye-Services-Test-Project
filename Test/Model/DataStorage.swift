//
//  DataStorage.swift
//  Test
//
//  Created by Aryan Sharma on 04/09/24.
//

import Foundation
import SwiftData

@Observable
class DataStorage {
    
    static let shared = DataStorage()
    
    private var context: ModelContext
    
    // Current User
    var currentUser: User?
    
    // Initialize DataStorage and create a ModelContext internally
    private init() {
        do {
            // Create a ModelContainer for the User model
            let modelContainer = try ModelContainer(for: User.self)
            // Initialize the ModelContext with the created ModelContainer
            self.context = ModelContext(modelContainer)
        } catch {
            fatalError("Failed to create ModelContainer: \(error.localizedDescription)")
        }
    }
    
    
    func isUserLoggedIn() -> Bool {
        if UserDefaults.standard.bool(forKey: "UserLoggedIn") {
            let username = UserDefaults.standard.string(forKey: "Username")
            setUserLoggedIn(username: username ?? "")
            return true
        }
        return false
    }
    
    func setUserLoggedIn(username: String) {
        self.currentUser = getUser(username: username)
        UserDefaults.standard.set(username, forKey: "Username")
        UserDefaults.standard.set(true, forKey: "UserLoggedIn")
    }
    
    func logoutUser() {
        UserDefaults.standard.set(false, forKey: "UserLoggedIn")
    }
    
    func getUser(username: String) -> User? {
        let fetchDescriptor = FetchDescriptor<User>(predicate: #Predicate { $0.username == username })
        do {
            let users = try context.fetch(fetchDescriptor)
            
            if !users.isEmpty {
                return users[0]
                
            } else {
                return nil
            }
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            return nil
        }
    }
    
    // Check if a user already exists with the given username
    func isUserPresent(username: String) -> Bool {
        let fetchDescriptor = FetchDescriptor<User>(predicate: #Predicate { $0.username == username })
        do {
            let users = try context.fetch(fetchDescriptor)
            return !users.isEmpty
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            return false
        }
    }
    
    
    func isUserPassCorrect(username: String, pass: String) -> Bool {
        let fetchDescriptor = FetchDescriptor<User>(predicate: #Predicate { $0.username == username })
        do {
            let users = try context.fetch(fetchDescriptor)
            if users.isEmpty {
                return false
            } else if users[0].password == pass {
                UserDefaults.standard.set(users[0].name, forKey: "NameOfCurrentUser")
                return true
            } else {return false}
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            return false
        }
        
    }
    
    // Create a new user
    func createUser(name: String, username: String, password: String) -> Bool {
        guard !isUserPresent(username: username) else {
            print("User with username \(username) already exists.")
            return false
        }
        
        let newUser = User(name: name, username: username, password: password, bookmarkedArticleIds: [], starredArticleIds: [])
        
        context.insert(newUser)
        do {
            try context.save()
            return true
        } catch {
            print("Failed to create user: \(error.localizedDescription)")
            return false
        }
    }
    
    // Delete an existing user
    func deleteUser(username: String) -> Bool {
        let fetchDescriptor = FetchDescriptor<User>(predicate: #Predicate { $0.username == username })
        do {
            let users = try context.fetch(fetchDescriptor)
            guard let userToDelete = users.first else {
                print("No user found with username \(username).")
                return false
            }
            context.delete(userToDelete)
            try context.save()
            return true
        } catch {
            print("Failed to delete user: \(error.localizedDescription)")
            return false
        }
    }
}

//    // Update the current user's information
//    func updateUser(name: String? = nil, password: String? = nil, bookmarkedArticleIds: [Int]? = nil) -> Bool {
//        guard let currentUser = self.currentUser else {
//            print("No user is currently logged in.")
//            return false
//        }
//
//        // Update fields if new values are provided
//        if let newName = name {
//            currentUser.name = newName
//        }
//
//        if let newPassword = password {
//            currentUser.password = newPassword
//        }
//
//        if let newBookmarkedArticleIds = bookmarkedArticleIds {
//            currentUser.bookmarkedArticleIds = newBookmarkedArticleIds
//        }
//
//        // Save the updated user object in the context
//        do {
//            try context.save()
//            return true
//        } catch {
//            print("Failed to update user: \(error.localizedDescription)")
//            return false
//        }
//    }
