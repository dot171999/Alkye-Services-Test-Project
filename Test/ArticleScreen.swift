//
//  ArticleDetailView.swift
//  Test
//
//  Created by Aryan Sharma on 02/09/24.
//

import SwiftUI

struct ArticleScreen: View {
    @State var viewModel = ViewModel()
    var article: Article
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack {
                    ArticleDetailHeaderView()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            HStack {
                                Text(article.heading+":")
                                    .font(Font.custom("Strawford-Bold", size: 26, relativeTo: .title))
                                Spacer()
                            }
                            .padding([.leading, .trailing])
                            
                            HStack {
                                Text(article.subHeading)
                                   .font(Font.custom("Strawford", size: 26, relativeTo: .title))
                                Spacer()
                            }
                            .padding([.leading, .trailing])
                             
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Type")
                                        .foregroundStyle(Color("SearchBar"))
                                        .font(Font.custom("Strawford", size: 14, relativeTo: .title))
                                    Text(article.type)
                                        .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Category")
                                        .foregroundStyle(Color("SearchBar"))
                                        .font(Font.custom("Strawford", size: 14, relativeTo: .title))
                                    Text(article.category)
                                        .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Date")
                                        .foregroundStyle(Color("SearchBar"))
                                        .font(Font.custom("Strawford", size: 14, relativeTo: .title))
                                    Text(article.date)
                                        .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                                }
                            }
                            .padding()
                           
                            ZStack {
                                GeometryReader { proxy in
                                    Image(article.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: proxy.size.width, height: 353)
                                        .clipped()
                                        .clipShape(.rect(cornerRadius: 25))
                                }

                                VStack {
                                    HStack {
                                        Image("BookMarkButton")
                                            .resizable()
                                            .frame(width: 46, height: 46)
                                        Spacer()
                                        Image("ShareButton")
                                            .resizable()
                                            .frame(width: 46, height: 46)
                                    }
                                    .padding(20)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ArticleScreen( article: Article(type: "", category: "", date: "", heading: "", subHeading: "", image: "SamplePhoto2", similarTopics: [""], parts: ["":""]))
}

struct ArticleDetailHeaderView: View {
    
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
