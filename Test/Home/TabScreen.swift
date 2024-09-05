//
//  TabScreen.swift
//  Test
//
//  Created by Aryan Sharma on 04/09/24.
//

import SwiftUI

struct TabScreen: View {
    @State private var selectedtTab: Tab = .articleFeed
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                TabView(selection: $selectedtTab) {
                    NavigationStack {
                        ArticleFeedScreen()
                            .tag(Tab.articleFeed)
                    }
                    
                    ArticlesScreen(isShowing: .bookmarked)
                        .tag(Tab.bookmark)
                    
                    
                    Text(selectedtTab.rawValue)
                        .tag(Tab.tv)
                    
                    ArticlesScreen(isShowing: .starred)
                        .tag(Tab.starred)
                    
                    ProfileScreen()
                        .tag(Tab.user)
                }
            }
            VStack {
                Spacer()
                HoveringTabBar(selectedTab: $selectedtTab)
                
            }
            .padding(.bottom,25)
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabScreen()
}
