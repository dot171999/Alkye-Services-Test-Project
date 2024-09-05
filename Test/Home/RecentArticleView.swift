//
//  RecentArticleView.swift
//  Test
//
//  Created by Aryan Sharma on 03/09/24.
//

import SwiftUI

struct RecentArticleView: View {
    @State private var offset: CGFloat = 0
    @State private var navigateToNewView = false
    
    var article: Article
    
    var frameHeight: CGFloat
    
    var body: some View {
        //NavigationStack {
            HStack(spacing: 0) {
                Image(article.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 149)
                    .clipped()
                
                VStack(alignment: .leading) {
                    HStack {
                        Image("YoutubePlayButton")
                            .resizable()
                            .frame(width: 33, height: 33)
                        Spacer()
                    }
                
                    HStack {
                        Image(systemName: "circlebadge.fill")
                            .resizable()
                            .frame(width: 13.5, height: 13.5)
                        Text(article.category)
                            .font(Font.custom("Strawford", size: 11, relativeTo: .title))
                        Spacer()
                    }
                    .padding(.top, 25)
                    
                    HStack {
                        Text("\(article.heading) :")
                            .font(Font.custom("Strawford-Bold", size: 16, relativeTo: .title))
                        + Text(" ")
                        + Text(article.subHeading)
                            .font(Font.custom("Strawford", size: 16, relativeTo: .title))
                    }
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack {
                        Text(self.article.date)
                            .foregroundColor(Color("SearchBar"))
                            .font(Font.custom("Strawford", size: 12, relativeTo: .title))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    
                    .padding(.bottom, 21)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 21)
                .padding(.leading, 21)
                .padding(.trailing)
            }
            .frame(height: frameHeight)
            .background(.white)
            .clipShape(.rect(cornerRadius: 22.5))
            .padding()
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        // Detect drag direction and update offset
                        if gesture.translation.width > 0 {
                            if gesture.translation.width <= 100 {
                                self.offset = gesture.translation.width
                            }
                        }
                    }
                    .onEnded { gesture in
                        // Check the drag amount to determine if it should be swiped
                        
                        if gesture.translation.width >= 100 {
                            self.navigateToNewView = true
                        }
                        withAnimation {
                            self.offset = 0 // Reset position
                        }
                    }
            )
            .navigationDestination(isPresented: $navigateToNewView) {
                ArticleScreen(article: article)
            }
        //}
    }
}

#Preview {
    NavigationStack {
        RecentArticleView(article: Article(), frameHeight: 320)
            .background(.red)
    }
    
}
