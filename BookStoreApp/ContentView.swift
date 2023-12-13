//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 13.12.23.
//

import SwiftUI

struct ContentView: View {
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
    ContentView()
}
