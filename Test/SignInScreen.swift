//
//  SignInScreen.swift
//  Test
//
//  Created by Aryan Sharma on 31/08/24.
//

import SwiftUI
import SwiftData

struct SignInScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var navigateToNewView = false
    @State private var wrongDetailsEntered = false
    
    private var userManager = UserManager.shared
    @Query private var users: [User]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack(alignment: .center) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("backButton")
                            .resizable()
                            .frame(width: 43, height: 43, alignment: .leading)
                    }
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                Text("Sign-in")
                    .font(Font.custom("Strawford", size: 36, relativeTo: .title))
                
                Spacer()
                
                TextField("Username", text: $username, prompt: Text(" Username")
                    .foregroundColor(.black))
                .frame(width: 280, height: 63)
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                    .stroke(.black, lineWidth: 1))
                .offset(x: wrongDetailsEntered ? 15 : 0) // Wiggle effect
                
                SecureField("Password", text: $password, prompt: Text(" Password").foregroundColor(.black))
                    .frame(width: 280, height: 63)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .stroke(.black, lineWidth: 1))
                    .offset(x: wrongDetailsEntered ? -15 : 0) // Wiggle effect
                
                Spacer()
                
                Button(action: {
                    if let user = users.first(where: {$0.username == self.username && $0.password == self.password}) {
                        let currentUser = userManager.setCurrentUser(to: user)
                        self.modelContext.insert(currentUser)
                        navigateToNewView = true
                    } else {
                        self.username = ""
                        self.password = ""
                        withAnimation(.default) {
                            self.wrongDetailsEntered.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.wrongDetailsEntered.toggle() // Stop the wiggle after a short duration
                        }
                    }
                }, label: {
                    Text("Let's go")
                        .tint(Color.white)
                        .frame(width: 203, height: 63)
                        .background(.black)
                        .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                        .cornerRadius(15)
                })
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationDestination(isPresented: self.$navigateToNewView) {
            TabScreen()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignInScreen()
        .modelContainer(DataController.previewContainer)
}
