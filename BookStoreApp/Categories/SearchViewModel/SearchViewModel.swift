//
//  SearchViewModel.swift
//  BookStoreApp
//
//  Created by Alex on 13.12.2023.
//

import Foundation

final class SearchViewModel: ObservableObject {
    // store the search results
    @Published var searchResults: [String] = []
    
    func getSearch(query: String) {
        // Here should be the code to access the API and get the data
    }
}
