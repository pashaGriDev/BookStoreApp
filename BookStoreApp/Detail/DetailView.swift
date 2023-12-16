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
    
    @State private var isFavourite = false
    
    var body: some View {
        VStack {
            switch modelData.isDetailInfoLoading {
            case true:
                DetailViewImp(
                    author: author,
                    item: modelData.detailInfo,
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
        .onAppear {
            print("onAppear: \(key)")
        }
    }
    
    init(
        key: String,
        author: String
    ) {
        self.key = key
        self.author = author
    }
}

#Preview {
    NavigationView {
        DetailView(key: "", author: "Bob")
            .environmentObject(ModelData())
    }
}
