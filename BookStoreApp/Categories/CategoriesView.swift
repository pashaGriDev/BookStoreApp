//
//  CategoriesView.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 13.12.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel = CategoryViewModel()
    
    @State private var searchText = ""
    @State private var sortIsActive = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SearchBarView(searchText: $searchText, sortIsActive: $sortIsActive)
                        .padding(.top)
                    HStack {
                        Text("Categories")
                            .font(.system(size: 25, weight: .regular))
                        Spacer()
                    }
                    .padding()
                    CategoriesRowView(categories: searchText.isEmpty ? viewModel.MockCategories : viewModel.MockCategories.filter({$0.contains(searchText.uppercased())}), sort: sortIsActive)
                }
            }
        }
    }
}



extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


#Preview {
    CategoryView()
}
