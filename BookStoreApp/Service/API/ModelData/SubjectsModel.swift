//
//  SubjectsModel.swift
//  BookStoreApp
//
//  Created by stimLite on 10.12.2023.
//

import Foundation


struct SubjectsModel: Codable {
    var key: String
    var name: String
    var subject_type: String
    var work_count: Int
    var works: [WorksModel]
}

struct WorksModel: Codable {
    var key: String
    var title: String
//    var edition_count: Int
    var cover_id: Int // картинка обложки по ид
//    var cover_edition_key: String // картинка обложки по olid
    var subject: [String]
//    var ia_collection: [String]
//    var lendinglibrary: Bool
//    var printdisabled: Bool
//    var lending_edition: String
//    var lending_identifier: String
    var authors: [AuthorsModel]
//    var first_publish_year: Int
//    var ia: String
//    var public_scan: Bool
//    var has_fulltext: Bool
//    var availability: AvailabilityModel?
}

struct AuthorsModel: Codable {
    var key: String
    var name: String
}
