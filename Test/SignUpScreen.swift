//
//  SignUpView.swift
//  Test
//
//  Created by Aryan Sharma on 31/08/24.
//

import SwiftUI

struct SignUpScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack {
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("backButton")
                            .resizable()
                            .frame(width: 43, height: 43, alignment: .leading)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Sign-up")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SignUpScreen()
}
