//
//  TabBarView.swift
//  BookStoreApp
//
//  Created by Alex on 05.12.2023.
//

import SwiftUI

enum Tab: CaseIterable {
    case home, categories, likes, account
    
    var title: String {
        switch self {
        case .home: "Home"
        case .categories: "Categories"
        case .likes: "Likes"
        case .account: "Account"
        }
    }
    
    var icon: String {
        switch self {
        case .home:  "house.fill"
        case .categories: "square.grid.2x2.fill"
        case .likes: "heart.fill"
        case .account: "person.fill"
        }
    }
}

struct TabBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: Tab
    
    var body: some View {
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    
                    Button {
                        withAnimation(.interactiveSpring(duration: 0.2)) {
                            selectedTab = tab
                        }
                    } label: {
                        VStack {
                            Image(systemName: tab.icon)
                                .font(.title2)
                                .foregroundStyle(
                                    selectedTab == tab
                                        ? .white
                                        : colorScheme == .dark ? .white : .black
                                )
                                .frame(width: 64, height: 32)
                                .background(selectedTab == tab ? .black : .clear)
                                .clipShape(Capsule())
                            
                            Text(tab.title)
                                .font(.footnote)
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(maxHeight: 70)
            .background(.ultraThinMaterial)
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
