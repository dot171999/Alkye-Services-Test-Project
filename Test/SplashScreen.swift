//
//  LoginSwiftUIView.swift
//  Test
//
//  Created by Aryan Sharma on 30/08/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
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
            }
        }
    }
}

#Preview {
    SplashScreen()
}
