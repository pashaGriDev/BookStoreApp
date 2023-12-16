//
//  CategoriesRowView.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 13.12.2023.
//

import SwiftUI

struct CategoriesListView: View {
    let categories : [String]
    let sort : Bool
    let newCategories = SubjectCategory.allCases

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach( sort ?
                         newCategories.sorted(by: { $0.rawValue < $1.rawValue}) :
                            newCategories.sorted(by: { $0.rawValue < $1.rawValue}).reversed(),
                         id: \.self) { item in
                    CategoryItem(categorie: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategoryItem: View {
//    var item: String
    var categorie: SubjectCategory
    
    var body: some View {
        NavigationLink(destination: CategorisBooksView(categorie: categorie)) {
            Text(categorie.rawValue)
                .clipShape(Rectangle())
                .frame(minWidth: 150, maxWidth: .infinity, minHeight: 120)
                .background(Image("category_\(Int.random(in: 1...4))"))
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold))
                .cornerRadius(5)
                .padding(5)
        }
    }
}

#Preview {
    CategoriesListView(categories: ["Category"], sort: false)
}
