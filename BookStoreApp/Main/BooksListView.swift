//
//  BooksListView.swift
//  BookStoreApp
//
//  Created by stimLite on 16.12.2023.
//

import SwiftUI

struct BooksListView: View {
//    @Binding var booksList: [WorksModel]
    @Binding var booksList: [BookModelData]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach($booksList.indices, id: \.self) { index in
                    NavigationLink {
                        Text("Detail view \(booksList[index].key)")
                    } label: {
                        BookCellView(item: booksList[index])
                    }
                }
            }
        }
    }
}

#Preview {
    BooksListView(
        booksList:
                .constant([BookModelData(title: "", key: "", category: "", author: "")]))
}
