//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 13.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tabItem {
                   Image(systemName: "house.fill")
                }
                .tag(0)
            CategoryView()
                .tabItem {
                   Image(systemName: "square.grid.2x2.fill")
                }
                .tag(1)
            FavoriteBooksView(books: [MockBook.getBook()])
                .tabItem {
                   Image(systemName: "heart.fill")
                }
                .tag(2)
            AccountView()
                .tabItem {
                   Image(systemName: "person.fill")
                }
                .tag(3)
        }
    }
}

/*
struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                MainView()
            case .categories:
                CategoryView()
            case .likes:
                FavoriteBooksView(books: [MockBook.getBook()])
            case .account:
                AccountView()
            }
            
            Spacer()
            
            TabBarView(selectedTab: $selectedTab)
        }
    }
}
*/
#Preview {
    ContentView()
}
