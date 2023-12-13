//
//  CategoryViewModel.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 13.12.2023.
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    var service = Network<Endpoint>()
    
    var MockCategories = ["ООО", "Classics",
                      "Fantasy", "Young Adult",
                      "Crime", "Horror",
                      "Sci-fi", "Drama",
                          "Folk"]
    
    
    func getData() {
        Task {

        }
    }
}
