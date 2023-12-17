//
//  MyDetailModel.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 17.12.23.
//

import Foundation

struct MyDetailModel: Codable, Hashable {
    let title: String
    let key: String
    let description: String
    let coversId: Int
    
    var isFavorit: Bool = false
}
