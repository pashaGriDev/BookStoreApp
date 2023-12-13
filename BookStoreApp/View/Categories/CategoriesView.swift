//
//  CategoriesView.swift
//  BookStoreApp
//
//  Created by Alex on 12.12.2023.
//

import SwiftUI

struct CategoriesView: View {
    @State private var searchText = ""

    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]
    
    let categories = ["Non-fiction", "Classics", "Fantasy", "Young Adult", "Crime", "Horror", "Sci-fi", "Drama", "Folk"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Categories")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .padding(.leading)
                
                LazyVGrid(columns: columns) {
                    ForEach(categories, id: \.self) { category in
                        NavigationLink {
                            // Book catalog view
                        } label: {
                            // start
                            Rectangle()
                                .foregroundStyle(.secondary)
                                .frame(height: 100)
                                .clipShape(.rect(cornerRadius: 5))
                                .overlay {
                                    Text(category)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                }
                            // end
                        }
                    }
                }
                .padding()
            }
        }
        .searchable(text: $searchText, prompt: "Search title/author/ISBN..")
    }
}

#Preview {
    CategoriesView()
}
