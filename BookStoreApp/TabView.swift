//
//  TabView.swift
//  BookStoreApp
//
//  Created by Alex on 04.12.2023.
//

import SwiftUI

struct TabView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                Text("HomeView")
            case .categories:
                Text("CategoriesView")
            case .likes:
                Text("LikesView")
            case .account:
                Text("AccountView")
            }
            
            Spacer()
            
            TabBarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    TabView()
}
