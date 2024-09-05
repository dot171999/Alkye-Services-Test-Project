//
//  ArticleDetailView.swift
//  Test
//
//  Created by Aryan Sharma on 02/09/24.
//

import SwiftUI

struct ArticleScreen: View {
    @State private var viewModel = ViewModel()
    @State private var isBookmarked = false
    
    var article: Article
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
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
                                    .frame(width: proxy.size.width)
                                    .clipped()
                                    .clipShape(.rect(cornerRadius: 25))
                            }
                            .frame(height: 353)
                            
                            VStack {
                                HStack {
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .padding(15)
                                        .frame(width: 46, height: 46)
                                        .background(isBookmarked ? .red : .black)
                                        .clipShape(.rect(cornerRadius: 23))
                                        .foregroundStyle(isBookmarked ? .black : .white)
                                        .onTapGesture {
                                            if let user = DataStorage.shared.currentUser {
                                                
                                                if !self.isBookmarked {
                                                    
                                                    user.bookmarkedArticleIds.append(self.article.Id)
                                                    self.isBookmarked = true
                                                } else {
                                                    user.bookmarkedArticleIds.removeAll(where: {$0 == self.article.Id})
                                                    self.isBookmarked = false
                                                }
                                            }
                                        }
                                    Spacer()
                                    Image("ShareButton")
                                        .resizable()
                                        .frame(width: 46, height: 46)
                                }
                                .padding(20)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        
                        let articleText = self.article.parts["Introduction"] ?? ""
                        
                        let firstLetter = articleText.isEmpty ? "" : String(articleText.prefix(1))
                        let modifiedText = articleText.isEmpty ? "" : String(articleText.dropFirst())
                        
                        let (first, second) = splitStringUntilPeriod(text: modifiedText)
                        if second == nil {
                            // Do something
                        }
                        else {
                            VStack (alignment: .leading, spacing: 0) {
                                HStack(alignment: .center, spacing: 0) {
                                    Text(firstLetter)
                                        .fixedSize()
                                        .font(Font.custom("Strawford", size: 100, relativeTo: .title))
                                        .offset(y: -15) // Adjust the offset to better align
                                        .lineSpacing(0)
                                    Text(first)
                                        .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                                        .lineSpacing(0)
                                        .padding([.leading, .trailing])
                                }
                                Text(second!)
                                    .font(Font.custom("Strawford", size: 18, relativeTo: .title))
                                    .offset(y: 0)
                            }
                            .padding(.horizontal)
                        }
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(self.article.similarTopics, id: \.self) { item in
                                NavigationLink {
                                    ContentView()
                                } label: {
                                    Text(item)
                                        .font(Font.custom("Strawford", size: 14, relativeTo: .title))
                                        .frame(height: 45)
                                        .frame(maxWidth: .infinity)
                                        .background(.white)
                                        .foregroundStyle(.black)
                                        .clipShape(.rect(cornerRadius: 25))
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            if let user = DataStorage.shared.currentUser, user.bookmarkedArticleIds.contains(self.article.Id) {
                self.isBookmarked = true
            }
        })
    }
    
    func splitStringUntilPeriod(text: String) -> (String , String?) {
        // Find the first occurrence of a period
        if let periodIndex = text.firstIndex(of: ".") {
            // Create the range for the first part up to and including the period
            let firstPart = String(text[...periodIndex])
            
            // Create the range for the second part after the period
            let secondPart = String(text[text.index(after: periodIndex)...])
            
            return (firstPart,secondPart)
        } else {
            // No period found, the entire text is the first part
            let firstPart = text
            return (firstPart,nil)
        }
    }
}

#Preview {
    
    ArticleScreen( article: Article())
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
