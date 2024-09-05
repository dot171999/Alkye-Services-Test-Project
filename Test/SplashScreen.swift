//
//  SplashScreen.swift
//  Test
//
//  Created by Aryan Sharma on 30/08/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    private let dataStorage = DataStorage.shared
    
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.isActive = true
                }
            }
            .overlay {
                if isActive {
                    if dataStorage.isUserLoggedIn() {
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
}
