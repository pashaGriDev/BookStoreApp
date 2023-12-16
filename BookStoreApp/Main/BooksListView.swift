//
//  BooksListView.swift
//  BookStoreApp
//
//  Created by stimLite on 16.12.2023.
//

import SwiftUI

struct BooksListView: View {
//    @Binding var booksList: [WorksModel]
    private var booksList: [BookModelData]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(booksList, id: \.self) { item in
                    NavigationLink {
                        DetailView(
                            key: item.key,
                            author: item.author
                        )
                    } label: {
                        BookCellView(item: item)
                    }
                }
            }
        }
    }
    
    init(
        _ booksList: [BookModelData]
    ) {
        self.booksList = booksList
    }
}

//#Preview {
//    BooksListView(
//        booksList:
//                .constant([BookModelData(title: "", key: "", category: "", author: "")]))
//}
