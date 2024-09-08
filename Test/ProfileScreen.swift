//
//  ProfileScreen.swift
//  Test
//
//  Created by Aryan Sharma on 03/09/24.
//

import SwiftUI
import SwiftData

struct ProfileScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    let dataStorage = UserManager.shared
    
    @State var userLoggedOut = false
    
    // Data model for the list sections
    struct SectionData {
        let title: String
        let items: [String]
    }
    
    let sections = [
            SectionData(title: "Settings", items: ["Profile", "Privacy", "Notifications"]),
            SectionData(title: "Account", items: ["Subscription", "Billing", "Logout"])
        ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    Spacer()
                    Image("SamplePhoto5")
                        .resizable()
                        .frame(width: 150,height: 150)
                        .clipShape(.rect(cornerRadius: 100))
                        .padding(.top)
                    Spacer()
                    
                    
                    Text(dataStorage.currentUser?.name ?? "No name")
                        .padding()
                    
                    List {
                        ForEach(sections, id: \.title) { section in
                            Section(header: Text(section.title)) {
                                ForEach(section.items, id: \.self) { item in
                                    if item == "Logout" {
                                        Button(action: {
                                            self.userLoggedOut = true
                                            if let user = self.dataStorage.currentUser {
                                                self.modelContext.delete(user)
                                            }
                                            self.dataStorage.logoutUser()
                                        }) {
                                            Text(item)
                                                .foregroundColor(.red) // Make logout stand out
                                        }
                                    } else {
                                        Text(item)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                }
            }
            .fullScreenCover(isPresented: $userLoggedOut, content: {
                
                WelcomeScreen()
            })
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ProfileScreen()
}
