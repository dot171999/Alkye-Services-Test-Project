//
//  ArticleFeedScreenHeader.swift
//  Test
//
//  Created by Aryan Sharma on 03/09/24.
//

import SwiftUI

extension ArticleFeedScreen {
    struct HeaderView: View {
        @Binding var text: String
        
        var body: some View {
            HStack {
            
                Image("Logo")
                    .resizable()
                    .frame(width: 43, height: 43)
                
                Spacer()
                
                SearchBarView(text: $text)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }

    struct SearchBarView: View {
        @Binding var text: String
        
        var body: some View {
            HStack {
                TextField(text: $text) {
                    Text("Search ....")
                        .foregroundColor(Color("SearchBar"))
                        .font(Font.custom("Strawford", size: 14, relativeTo: .title))
                }
                .padding(.leading, 5)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("SearchBar"))
            }
            .frame(width: 149, height: 40)
            .padding([.leading, .trailing])
            .background(.white)
            .cornerRadius(20)
        }
    }
}

#Preview {
    ArticleFeedScreen.HeaderView(text: .constant(""))
        .background(.red)
}


