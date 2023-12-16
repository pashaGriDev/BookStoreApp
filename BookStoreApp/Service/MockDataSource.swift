//
//  TestDataSource.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 14.12.23.
//

import Foundation

let mockWork: WorksModel = Bundle.main.load("mockWork.json")
let mockDocs: DocsModel = Bundle.main.load("mockDocs.json")
//let mockDetailBook: DetailBookModel = Bundle.main.load("mockDetailBook.json") // крашится

extension Bundle {
    func load<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            assert(false, "Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            assert(false, "Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            assert(false, "Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}

