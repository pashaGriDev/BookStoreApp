//
//  BookCategoriesView.swift
//  BookStoreApp
//
//  Created by Alex on 13.12.2023.
//

import SwiftUI

struct BookCategoriesView: View {
    @StateObject var searchViewModel = SearchViewModel()
    @State private var searchText = ""
    
    let categories = ["Non-fiction", "Classics", "Fantasy", "Young Adult", "Crime", "Horror", "Sci-fi", "Drama", "Folk"]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                if searchText.isEmpty {
                    HStack {
                        Text("Categories")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(categories, id: \.self) { category in
                            NavigationLink {
                                // во вью с каталогом книг по жанру
                            } label: {
                                CategoryItemView(title: category)
                            }
                            
                        }
                    }
                } else {
                    List(searchViewModel.searchResults, id: \.self) { searchResult in
                        // какое-то вью отображающее результаты поиска..
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search by books/authors/titles..")
        // поиск по запросу
        .onChange(of: searchText) { newValue in
            searchViewModel.getSearch(query: newValue)
        }
    }
}

#Preview {
    BookCategoriesView()
}
