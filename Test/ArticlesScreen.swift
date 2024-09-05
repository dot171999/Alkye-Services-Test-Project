//
//  AllRecentArticlesView.swift
//  Test
//
//  Created by Aryan Sharma on 01/09/24.
//

import SwiftUI

struct ArticlesScreen: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                AllArticlesHeaderView()
                Spacer()
            }
            
        }
    }
}

#Preview {
    ArticlesScreen()
}

struct AllArticlesHeaderView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image("backButton")
                    .resizable()
                    .frame(width: 43, height: 43, alignment: .leading)
            }
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 45, height: 45)
        }
        .padding()
        
    }
}

