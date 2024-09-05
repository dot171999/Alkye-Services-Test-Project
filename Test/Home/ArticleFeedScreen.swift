//
//  ArticleFeedScreen.swift
//  Test
//
//  Created by Aryan Sharma on 31/08/24.
//

import SwiftUI

struct ArticleFeedScreen: View {
    @State private var search = ""
    @State var viewModel = ViewModel()
    
    var body: some View {
        //NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    HeaderView(text: $search)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            VStack {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack (spacing: 20) {
                                        ForEach(viewModel.articles) { article in
                                            NavigationLink {
                                                ArticleScreen(article: article)
                                            } label: {
                                                ArticleView(
                                                    article: article,
                                                    frameWidth: 278)
                                                .foregroundStyle(.black)
                                            }
                                        }
                                    }
                                    .padding()
                                }
                                
                                RecentArticlesView(articles: viewModel.articles)
                            }
                            .background(Color("Background"))
                            
                            SocialConnectView()
                                .padding(.top)
                                .background(.black)
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationBarBackButtonHidden(true)
        }
   // }
}

#Preview {
    ArticleFeedScreen()
}

struct BackgroundView: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle().frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(Color("Background")).ignoresSafeArea()
            Rectangle().frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.black).ignoresSafeArea()
        }
    }
}


struct AllArticlesButton: View {
    var body: some View {
        NavigationLink {
            ArticlesScreen(isShowing: .all)
        } label: {
            Text("View all")
                .tint(Color.black)
                .frame(width: 203, height: 40)
                .background(.white)
                .font(Font.custom("Strawford", size: 12, relativeTo: .title))
                .clipShape(.rect(cornerRadius: 20))
                .padding()
        }
    }
}

struct SocialConnectItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image("SamplePhoto")
                .resizable()
                .scaledToFill()
                .frame(width: 224, height: 296)
                .clipped()
                .padding(.bottom)
            
            Text("The Ultimate Guide To Simplifying Your Routine With Generative AI Automation!")
                .font(Font.custom("Strawford", size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundStyle(.black)
            
            Spacer()
        }
        .frame(width: 224, height: 456)
        .background(.white)
        .clipShape(.rect(cornerRadius: 22.5))
        .overlay(content: {
            VStack {
                HStack {
                    Image("InstagramButton")
                        .resizable()
                        .frame(width: 33, height: 33)
                        .clipShape(.rect(cornerRadius: 5))
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
        .padding(.leading)
        .padding(.top)
        .padding(.bottom, 40)
    }
}

struct SocialConnectView: View {
    var body: some View {
        VStack {
            Text("Social Connect")
                .font(Font.custom("Strawford-Bold", size: 22, relativeTo: .title))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top)
            Text("Stay update with my latest post on your favorite platforms")
                .font(Font.custom("Strawforw-Thin", size: 16, relativeTo: .title))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    SocialConnectItemView()
                    SocialConnectItemView()
                    SocialConnectItemView()
                    SocialConnectItemView()
                }
            }
        }
    }
}

struct RecentArticlesView: View {

    @State var articles: [Article]
    
    var body: some View {
        Text("Recent Articles")
            .font(Font.custom("Strawford-Bold", size: 22, relativeTo: .title))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        
        ForEach(articles.reversed()) { article in
            RecentArticleView(
                article: article,
                frameHeight: 278)
                .tint(.black)
        }
        
        AllArticlesButton()
            .padding(.bottom)
    }
}
