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
//    private let booksList: [BookModelData]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(categorie: SubjectCategory) {
        self.categorie = categorie
    }
    
    var body: some View {
        NavigationView {
            ScrollView(){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach($modelData.books.indices, id: \.self) { index in
                        NavigationLink {
                            Text("Detail view \(modelData.books[index].key)")
                        } label: {
                            BookCellView(item: modelData.books[index])
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .task {
            await modelData.getSubject(category: categorie)
        }
    }
}

#Preview {
    CategorisBooksView(categorie: .drama)
        .environmentObject(ModelData())
}
