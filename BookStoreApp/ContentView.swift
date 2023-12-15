//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 13.12.23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("theme") private var isDark = false
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
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
            }
            
            VStack {
                Spacer()
                TabBarView(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(.keyboard)
        .preferredColorScheme(isDark ? .dark : .light)
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
