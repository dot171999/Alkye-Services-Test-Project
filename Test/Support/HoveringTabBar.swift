//
//  HoveringTabBar.swift
//  Test
//
//  Created by Aryan Sharma on 04/09/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case articleFeed = "book"
    case bookmark = "bookmark"
    case tv = "play.tv"
    case starred = "star"
    case user = "person"
}

struct HoveringTabBar: View {
    @Binding var selectedTab: Tab 
    
    var body: some View {
        ZStack {
            Color(.white)
                .clipShape(.rect(cornerRadius: 35))
                .shadow(color: Color(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)), radius: 17.5, y: 4)
                
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundStyle(selectedTab == tab ? .black : .white)
                        Image(systemName: tab.rawValue)
                            .imageScale(.large)
                            .foregroundStyle(selectedTab == tab ? .white : .black)
                            .onTapGesture {
                                selectedTab = tab
                            }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity)
    }
            
}

#Preview {
    HoveringTabBar(selectedTab: .constant(Tab.articleFeed))
}
