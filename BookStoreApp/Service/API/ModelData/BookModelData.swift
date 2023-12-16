//
//  BookModelData.swift
//  BookStoreApp
//
//  Created by stimLite on 16.12.2023.
//

import Foundation


struct BookModelData: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var key: String
    var category: String
    var author: String
    var coverId: Int?
}
