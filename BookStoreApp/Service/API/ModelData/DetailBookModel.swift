//
//  DetailBookModel.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 14.12.23.
//

import Foundation

struct DetailBookModel: Decodable {
    let title: String
    let key: String
    let description: String
    let covers: [Int]
    
    var desc: String {
        "No description"
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case key
        case description
        case covers
    }
    
    var firstImageCover: Int {
        guard let id = covers.first else {
            print("Не удалось получить ИД обложки книги!")
            return 0
        }
        return id
    }
}

struct DetailBookModel2: Decodable {
    let title: String
    let key: String
    let description: DescriptionStruct
    let covers: [Int]
    
    var desc: String {
        "No description"
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case key
        case description
        case covers
    }
    
    var firstImageCover: Int {
        guard let id = covers.first else {
            print("Не удалось получить ИД обложки книги!")
            return 0
        }
        return id
    }
}

struct DescriptionStruct: Decodable {
    var type: String
    var value: String
}
