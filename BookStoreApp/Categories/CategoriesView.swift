//
//  CategoriesView.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 13.12.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel = CategoryViewModel()
    @EnvironmentObject var modelData: ModelData
    
    @State private var searchText = ""
    @State private var sortIsActive = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SearchBarView(searchText: $searchText, sortIsActive: $sortIsActive, cancelButton: {
                        modelData.searchCategory(search: nil)
                    })
                        .padding(.top)
                        .onSubmit {
                            modelData.searchCategory(search: searchText)
                        }
                    HStack {
                        Text("Categories")
                            .font(.system(size: 25, weight: .regular))
                        Spacer()
                    }
                    .padding()
                    CategoriesListView(categories: searchText.isEmpty ? viewModel.MockCategories : viewModel.MockCategories.filter({$0.contains(searchText.uppercased())}), sort: sortIsActive)
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
        .environmentObject(ModelData())
}
