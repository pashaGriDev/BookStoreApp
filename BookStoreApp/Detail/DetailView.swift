//
//  DView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var modelData: ModelData
    
    private let key: String
    private let author: String
    
    @State private var item: DetailBookModel?
    @State private var isLoading = false
    @State private var isFavourite = false
    
    var body: some View {
        VStack {
            switch modelData.isDetailInfoLoading {
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
        .task {
            await modelData.getDetailDataBy(key: key)
        }
        .onDisappear {
            modelData.isDetailInfoLoading.toggle()
        }
    }
    
    init(
        key: String = "123",
        author: String = "Taylor Swift",
        item: DetailBookModel?
    ) {
        self.key = key
        self.author = author
        self.item = item
    }
}

#Preview {
    NavigationView {
        DetailView(item: nil)
            .environmentObject(ModelData())
    }
}
