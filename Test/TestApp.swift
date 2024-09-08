//
//  TestApp.swift
//  Test
//
//  Created by Aryan Sharma on 30/08/24.
//

import SwiftUI
import SwiftData

@main
struct TestApp: App {
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
        .modelContainer(for: [User.self, CurrentUser.self])
    }
}
