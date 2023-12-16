//
//  BookListView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct BookListView: View {
    // сделать инициализатор
    // структура должна приниматься массив данных для цикла
    var booksList: [BookModelData]
    
    init(booksList: [BookModelData]) {
        self.booksList = booksList
    }
    
    var body: some View {
        ScrollView {
            ForEach(booksList.indices, id: \.self) { item in
                NavigationLink {
                    Text("Show detail view!")
                } label: {
                    CardViewCell(coverId: booksList[item].coverId ?? 0,
                                 title: booksList[item].title,
                                 author: booksList[item].author) {
                        print("Close card!")
                    }
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    BookListView(booksList: [BookModelData(title: "", key: "", category: "", author: "")])
}
