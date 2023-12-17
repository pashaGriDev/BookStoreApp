//
//  FavoriteBooksView.swift
//  BookStoreApp
//
//  Created by Alex on 08.12.2023.
//

import SwiftUI

struct FavoriteBooksView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            BookListView(booksList: modelData.favoriteBooks)
                .navigationTitle("Favorite books")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteBooksView()
}

