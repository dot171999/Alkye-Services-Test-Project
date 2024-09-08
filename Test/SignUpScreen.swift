//
//  SignUpView.swift
//  Test
//
//  Created by Aryan Sharma on 31/08/24.
//

import SwiftUI
import SwiftData

struct SignUpScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    
    @State private var navigateToNewView = false
    
    @State private var errorMessage = "Please provide your details."
    
    private let userStorage = UserManager.shared
    
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
                
                Text("Sign-up")
                    .font(Font.custom("Strawford", size: 36, relativeTo: .title))
                
                Spacer()
                
               
                Text(errorMessage)
                    .tint(Color.black)
                    .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                
                
                TextField("Name", text: $name, prompt: Text("Name")
                    .foregroundColor(.black))
                    .frame(width: 280, height: 63)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .stroke(.black, lineWidth: 1))
                    
                
                TextField("Username", text: $username, prompt: Text("Username")
                    .foregroundColor(.black))
                    .frame(width: 280, height: 63)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .stroke(.black, lineWidth: 1))
                
                SecureField("Password", text: $password, prompt: Text("Password").foregroundColor(.black))
                    .frame(width: 280, height: 63)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .stroke(.black, lineWidth: 1))
                
                Spacer()
                
                Button(action: {
                    if self.users.contains(where: {$0.username == self.username}) {
                        errorMessage = "Username taken"
                        self.username = ""
                    } else if username == "" || password == "" || name == "" {
                        errorMessage = "Fill All fields."
                    } else {
                        let user = User(name: name, username: username, password: password)
                        let currentUser = CurrentUser(user: user)
                        self.context.insert(user)
                        self.context.insert(currentUser)
                        self.userStorage.setCurrentUser(equalTo: currentUser)
                        self.navigateToNewView = true
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
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    
        .navigationDestination(isPresented: $navigateToNewView) {
            TabScreen()
        }
    }
}

#Preview {
    SignUpScreen()
        .modelContainer(DataController.previewContainer)
}
