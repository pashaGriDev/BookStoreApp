//
//  CategorisBooksView.swift
//  BookStoreApp
//
//  Created by stimLite on 17.12.2023.
//

import SwiftUI

struct CategorisBooksView: View {
    @EnvironmentObject var modelData: ModelData
    private let categorie: SubjectCategory
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(categorie: SubjectCategory) {
        self.categorie = categorie
    }
    
    var body: some View {
        
        ScrollView(){
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach($modelData.books.indices, id: \.self) { item in
                    NavigationLink {
                        DetailView(key: modelData.books[item].key,
                                   author: modelData.books[item].author)
                    } label: {
                        BookCellView(item: modelData.books[item])
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(categorie.rawValue)
        .task {
            await modelData.getSubject(category: categorie)
        }
    }
}

#Preview {
    CategorisBooksView(categorie: .drama)
        .environmentObject(ModelData())
}
