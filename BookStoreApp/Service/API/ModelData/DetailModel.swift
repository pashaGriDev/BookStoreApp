//
//  DetailModel.swift
//  BookStoreApp
//
//  Created by stimLite on 10.12.2023.
//

import Foundation


struct AthorDetailModel: Codable {
    var key: String // "/authors/OL21594A",
    var remote_ids: RemoteIdsModel
    var type: TypeModel
    var links: [LinksModel]
    var name: String
    var bio: String
    var source_records: [String]
    var alternate_names: [String]
    var death_date: String
    var birth_date: String
    var personal_name: String
    var photos: [Int]
    var title: String
    var latest_revision: Int
    var revision: Int
    var created: DatetimeModel
    var last_modified: DatetimeModel
}

struct RemoteIdsModel: Codable {
    var viaf: String
    var goodreads: String
    var amazon: String
    var isni: String
    var librivox: String
    var project_gutenberg: String
    var librarything: String
    var wikidata: String
}

struct TypeModel: Codable {
    var key: String
}

struct LinksModel: Codable {
    var url: String
    var title: String
    var type: TypeModel
}

struct DatetimeModel: Codable {
        var type: String
        var value: String 
}
