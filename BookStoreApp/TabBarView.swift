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
    
    var icon: Image {
        switch self {
        case .home:
            return Image(systemName: "house.fill")
        case .categories:
            return Image(systemName: "square.grid.2x2.fill")
        case .likes:
            return Image(systemName: "heart.fill")
        case .account:
            return Image(systemName: "person.fill")
        }
    }
}

struct TabBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    
                    Button(action: { selectedTab = tab }) {
                        VStack {
                            tab.icon
                                .font(.title)
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
                    .animation(.interactiveSpring, value: selectedTab)
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 70)
            .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
