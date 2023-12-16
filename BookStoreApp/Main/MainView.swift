//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 03.12.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var searchText = ""
    @State private var sortIsActive = false

    
    var body: some View {
        NavigationView {
            VStack {
                MainSearchView(searchText: $searchText, isSearch: $modelData.isSearch, action: {
                    if !modelData.isSearch {
                        Task {
                            await modelData.getSearchItems(search: searchText)
                        }
                    } else {
                        searchText.removeAll()
                        modelData.isSearch.toggle()
                    }
                })
                    .padding(.vertical)
                
                if modelData.isSearch {
                    BookListView(booksList: $modelData.getSearch)
                } else {
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
                    
                    ScrollView {
                        BooksListView(modelData.books)
                        
                        Divider()
                        
                        HeadlineView(headline: "Recent Books", buttonTitle: "see more", action: {})
                        
                        BooksListView(modelData.books)
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
