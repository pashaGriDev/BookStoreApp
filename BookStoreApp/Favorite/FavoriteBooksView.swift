//
//  FavoriteBooksView.swift
//  BookStoreApp
//
//  Created by Alex on 08.12.2023.
//

import SwiftUI

struct FavoriteBooksView: View {
    let books: [MockBook]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(books) { book in
                    BookсardRowView(book: book)
                }
            }
            .navigationTitle("Favorite books")
            .navigationBarTitleDisplayMode(.inline)
            // back to DetailView
//            .navigationDestination(for: MockBook.self) { selectedBook in
//                DetailView(book: selectedBook)
//            }
        }
    }
}

#Preview {
    FavoriteBooksView(books: [MockBook.getBook()])
}
