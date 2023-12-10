//
//  RecentModel.swift
//  BookStoreApp
//
//  Created by stimLite on 07.12.2023.
//

import Foundation

struct RecentModel: Codable {
    var id: String
    var kind: String
    var timestamp: String
    var comment: String?
    var changes: [ChangesModel]
    var author: AuthorModel
    var ip: String?
//    var data: {} пока не понятно что тут живет
}

struct AuthorModel: Codable {
    var key: String
}

struct ChangesModel: Codable {
    var key: String
    var revision: Int
}
