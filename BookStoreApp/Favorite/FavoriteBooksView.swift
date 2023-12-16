//
//  FavoriteBooksView.swift
//  BookStoreApp
//
//  Created by Alex on 08.12.2023.
//

import SwiftUI
// image url
// "https://covers.openlibrary.org/b/id/258027-M.jpg"
struct FavoriteBooksView: View {
//    let books: [MockBook]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0...2, id: \.self) { _ in
                    NavigationLink {
//                        DetailView(book: book)
                    } label: {
                        CardViewCell() { print("Close card!") }
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Favorite books")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteBooksView()
}
