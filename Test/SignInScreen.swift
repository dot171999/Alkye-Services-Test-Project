//
//  SignInView.swift
//  Test
//
//  Created by Aryan Sharma on 31/08/24.
//

import SwiftUI

struct SignInScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
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
                    
                    TextField("Username", text: $username, prompt: Text(" Username").foregroundColor(.black))
                        .frame(width: 303, height: 63)
                        .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .stroke(.black, lineWidth: 1))
                    
                    SecureField("Password", text: $username, prompt: Text(" Password").foregroundColor(.black))
                        .frame(width: 303, height: 63)
                        .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .stroke(.black, lineWidth: 1))
                    
                    Spacer()
                    
                    NavigationLink(destination: HomeScreen()) {
                        Text("Let's go")
                            .tint(Color.white)
                            .frame(width: 203, height: 63)
                            .background(.black)
                            .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                            .cornerRadius(15)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SignInScreen()
}
