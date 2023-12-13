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
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        BookсardRowView(book: book)
                    }
                }
            }
            .navigationTitle("Favorite books")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteBooksView(books: [MockBook.getBook()])
}
