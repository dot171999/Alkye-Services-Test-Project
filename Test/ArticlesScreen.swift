//
//  ArticlesScreen.swift
//  Test
//
//  Created by Aryan Sharma on 01/09/24.
//

import SwiftUI

struct ArticlesScreen: View {
    
    enum Articles: String {
        case all = "All Articles"
        case bookmarked = "Bookmarked Articles"
        case starred = "Starred Articles"
    }
    
    @State private var viewModel = ViewModel()
    
    @State var isShowing: Articles
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack {
                    //HeaderView()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
    
                            VStack {
                                ForEach(viewModel.filterArticles(for: isShowing)) { article in
                                    RecentArticleView(
                                        article: article,
                                        frameHeight: 278)
                                    .tint(.black)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .navigationTitle(isShowing.rawValue)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ArticlesScreen(isShowing: .bookmarked)
}

extension ArticlesScreen {

    struct HeaderView: View {
        
        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
            HStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 45, height: 45)
            }
            .padding()
            
        }
    }
}

