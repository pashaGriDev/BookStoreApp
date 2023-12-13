//
//  CategoriesRowView.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 13.12.2023.
//

import SwiftUI

struct CategoriesRowView: View {
    let categories : [String]
    let sort : Bool

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(sort ? categories.sorted() : categories.sorted().reversed(), id: \.self) { item in
                    CategoryItem(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategoryItem: View {
    var item: String
    
    var body: some View {
        NavigationLink(destination: ContentView()) {
            Text(item)
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
    CategoriesRowView(categories: ["Category"], sort: false)
}
