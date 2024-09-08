//
//  SplashScreen.swift
//  Test
//
//  Created by Aryan Sharma on 30/08/24.
//

import SwiftUI
import SwiftData

struct SplashScreen: View {
    
    // Get CurrentUser instance from local db if present.
    @Query private var currentUsers: [CurrentUser]
    
    // Shared helper class to manage user data.
    let userManager = UserManager.shared
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @State private var splashAnimationFinished = false
    @State private var userSuccessfullyLoggedIn = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Image("Logo")
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1
                            self.opacity = 1.0
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                if userManager.check(forAny: currentUsers) {
                    // Validate user credentials from API. No API, using SwiftData right now.
                    self.userSuccessfullyLoggedIn.toggle()
                   
                } else if userManager.isFirstLaunch() {
                    // Show onboarding
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.splashAnimationFinished.toggle()
                }
            }
            .overlay {
                if splashAnimationFinished {
                    if userSuccessfullyLoggedIn {
                        TabScreen()
                    } else {
                        WelcomeScreen()
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
        .modelContainer(DataController.previewContainer)
}
