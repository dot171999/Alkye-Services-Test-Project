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
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack {
                    TabView(selection: $selectedtTab) {
                        switch selectedtTab {
                        case .articleFeed:
                            HomeScreen()
                        case .bookmark:
                            Text(selectedtTab.rawValue)
                        case .tv:
                            Text(selectedtTab.rawValue)
                        case .notifications:
                            Text(selectedtTab.rawValue)
                        case .user:
                            ProfileScreen()
                        }
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabScreen()
}
