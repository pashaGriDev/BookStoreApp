//
//  URL + ext.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import Foundation

extension URL {
    static func createUrlBy(id: Int) -> Self {
        let url = URL(string: "https://covers.openlibrary.org/b/id/\(id)-M.jpg")!
        return url
    }
    
    static func createUrlBy(olid: String) -> Self {
        let url = URL(string: "https://covers.openlibrary.org/b/olid/\(olid)-M.jpg")!
        return url
    }
}

