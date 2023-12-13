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

#Preview {
    ContentView()
}
