//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 03.12.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var modelData: ModelData
    
//    @StateObject var vm = MainViewModel()
    @State private var searchText = ""
    @State private var sortIsActive = false
    var scrollOrintation = true
    
    var body: some View {
        NavigationView {
            VStack {
                MainSearchView(searchText: $searchText, action: {
                    Task {
                        await modelData.getSearchItems(search: searchText)
                    }
                })
                    .padding(.bottom)
                
                HeadlineView(headline: "Top Books",
                             buttonTitle: "see more",
                             action: {
                    
                })
                
                HStack(spacing: 16) {
                    SwitchButtonView(title: "This Week")
                    SwitchButtonView(title: "This Month")
                    SwitchButtonView(title: "This Year")
                    Spacer()
                }
                .padding([.leading, .bottom])
                
                
                if modelData.isSearch {
                    ScrollView {
                        BooksListView(booksList: $modelData.books)
//                        Text(modelData.searchItem?.name ?? "")
                    }
                } else {
                    ScrollView {
                        BooksListView(booksList: $modelData.books)
                        
                        Divider()
                        
                        HeadlineView(headline: "Recent Books", buttonTitle: "see more", action: {})
                        
                        BooksListView(booksList: $modelData.books)
                    }
                }
            }
            .task {
                await modelData.getSubject()
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ModelData())
}
