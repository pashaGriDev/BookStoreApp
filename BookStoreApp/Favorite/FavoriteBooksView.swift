//
//  FavoriteBooksView.swift
//  BookStoreApp
//
//  Created by Alex on 08.12.2023.
//

import SwiftUI

// "https://covers.openlibrary.org/b/id/258027-M.jpg"
struct FavoriteBooksView: View {
    
// должен принимать массив книг и
// передавать его в BookListView
    
    var body: some View {
        NavigationView {
            BookListView()
                .navigationTitle("Favorite books")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteBooksView()
}

