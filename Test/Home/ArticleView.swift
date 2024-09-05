//
//  LatestArticleView.swift
//  Test
//
//  Created by Aryan Sharma on 03/09/24.
//

import SwiftUI

struct ArticleView: View {
    var article: Article
    
    var frameWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(article.image)
                .resizable()
                .scaledToFill()
                .frame(width: frameWidth, height: 249)
                .clipped()
            
            HStack {
                Image(systemName: "circlebadge.fill")
                Text(article.category)
                    .font(Font.custom("Strawford", size: 14, relativeTo: .title))
                Spacer()
            }
            .padding(.leading, 25)
            .padding(.top, 25)
            
            HStack {
                Text("\(article.heading): ")
                    .font(Font.custom("Strawford-Bold", size: 16, relativeTo: .title))
                + Text("")
                + Text(article.subHeading)
                    .font(Font.custom("Strawford", size: 16, relativeTo: .title))
            }
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.trailing)
            .padding(.top)
            
            
            Spacer()
            
            HStack {
                Text(self.article.date)
                    .foregroundStyle(Color("SearchBar"))
                    .font(Font.custom("Strawford", size: 12, relativeTo: .title))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 25)
            .padding(.bottom, 25)
        }
        .frame(width: frameWidth, height: 440)
        .background(.white)
        .clipShape(
            .rect(topLeadingRadius: 22.5, bottomLeadingRadius: 22.5, bottomTrailingRadius: 22.5, topTrailingRadius: 0)
        )
        .overlay(content: {
            VStack {
                HStack {
                    Image("YoutubePlayButton")
                        .resizable()
                        .frame(width: 33, height: 33)
                    Spacer()
                    Image("StarButton")
                        .resizable()
                        .frame(width: 33, height: 33)
                }
                .padding(25)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

#Preview {
    ArticleView(article: Article(), frameWidth: 278)
        .background(.red)
}
