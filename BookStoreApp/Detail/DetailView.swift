//
//  DView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct DetailView: View {
    private let id: String
    private let author: String
    
    @State private var item: DetailBookModel?
    @State private var isLoading = false
    @State private var isFavourite = false
    
    var body: some View {
        VStack {
            switch isLoading {
            case true:
                DetailViewImp(
                    author: author,
                    item: item,
                    isFavourite: $isFavourite
                )
            case false:
                ProgressView()
            }
        }
        .onAppear {
            print("Получить данные")
            sleep(3)
            // передать ИД в запрос
            self.item = mockDetailBook
        }
    }
    
    init(
        id: String = "123",
        author: String = "Taylor Swift",
        item: DetailBookModel?
    ) {
        self.id = id
        self.author = author
        self.item = item
    }
}

#Preview {
    NavigationView {
        DetailView(item: nil)
    }
}
