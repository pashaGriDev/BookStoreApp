//
//  SearchDataModel.swift
//  BookStoreApp
//
//  Created by stimLite on 06.12.2023.
//

import Foundation


struct SearchModel: Codable {
    var numFound: Int
    var start: Int
    var numFoundExact: Bool
    var docs: [DocsModel]
    var num_found: Int
    var q: String
    var offset: Int?
}

struct DocsModel: Codable {
    var key: String
    var type: String
    var seed: [String]
    var title: String
    var title_suggest: String
    var title_sort: String
    var edition_count: Int
    var edition_key: [String]
    var publish_date: [String]
    var publish_year: [Int]
    var first_publish_year: Int
    var number_of_pages_median: Int?
    var isbn: [String]
    var last_modified_i: Int
    var ebook_count_i: Int
    var ebook_access: String
    var has_fulltext: Bool
    var public_scan_b: Bool
    var cover_edition_key: String?
    var cover_i: Int?
    var publisher: [String]
    var author_key: [String]
    var author_name: [String]
    var publisher_facet: [String]?
    var author_facet: [String]?
    var subject: [String]?
}
