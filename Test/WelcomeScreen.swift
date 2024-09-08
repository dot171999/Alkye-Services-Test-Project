//
//  WelcomeScreen.swift
//  Test
//
//  Created by Aryan Sharma on 30/08/24.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    WelcomeView()
                    
                    QuoteView()
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        SignUpButton()
                        
                        SignInButton()
                        
                        TermsButton()
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    WelcomeScreen()
        .modelContainer(DataController.previewContainer)
}

extension WelcomeScreen {
    private struct WelcomeView: View {
        var body: some View {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 15)
                Text("Welcome")
                    .font(Font.custom("Strawford", size: 24, relativeTo: .title).weight(Font.Weight.heavy))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading, 45)
            .padding(.trailing, 45)
        }
    }

    struct QuoteView: View {
        var body: some View {
            HStack {
                Text("\"")
                    .font(Font.custom("NorthwellAlt", size: 120, relativeTo: .title))
                
                Text("In a world of finite resources, the true measure of innovation lies not in its complexity, but in its capacity to simplify and empower the human mind.")
                    .font(Font.custom("Scilla-RegularItalic", size: 18, relativeTo: .title).weight(Font.Weight.light))
                    .lineSpacing(5.0)
                    .padding(.top, 35)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
            .padding(.leading, 45)
            .padding(.trailing, 45)
            .padding(.bottom, 45)
        }
    }

    struct SignUpButton: View {
        var body: some View {
            NavigationLink {
                SignUpScreen()
            } label: {
                Text("Sign-up")
                    .foregroundStyle(.white)
                    .frame(width: 303, height: 63)
                    .background(.black)
                    .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                    .cornerRadius(15)
            }
        }
    }

    struct SignInButton: View {
        var body: some View {
            NavigationLink {
                SignInScreen()
            } label: {
                Text("Sign-in")
                    .frame(width: 303, height: 63)
                    .foregroundStyle(.black)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .stroke(.black, lineWidth: 1))
                    .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                    .padding(.top, 5)
            }
        }
    }

    struct TermsButton: View {
        var body: some View {
            Button(action: {
                print("Button press3")
            }, label: {
                Text("Terms")
                    .tint(Color.black)
                    .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                    .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .fontWeight(.light)
            })
            .padding(.top, 30)
            .padding(.bottom, 5)
        }
    }
}
