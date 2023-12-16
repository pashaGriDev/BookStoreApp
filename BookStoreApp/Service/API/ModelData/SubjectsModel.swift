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
    var edition_count: Int
    var cover_id: Int // картинка обложки по ид
    var cover_edition_key: String // картинка обложки по olid
    var subject: [String]
    var ia_collection: [String]
    var lendinglibrary: Bool
    var printdisabled: Bool
    var lending_edition: String
    var lending_identifier: String
    var authors: [AuthorsModel]
    var first_publish_year: Int
    var ia: String
    var public_scan: Bool
    var has_fulltext: Bool
    var availability: AvailabilityModel
}

struct AvailabilityModel: Codable {
    var status: String
    var available_to_browse: Bool
    var available_to_borrow: Bool
    var available_to_waitlist: Bool
    var is_printdisabled: Bool
    var is_readable: Bool
    var is_lendable: Bool
    var is_previewable: Bool
    var identifier: String
    var openlibrary_work: String
    var openlibrary_edition: String
    var last_loan_date: String?
    var is_restricted: Bool?
    var is_browseable: Bool?
}

struct AuthorsModel: Codable {
    var key: String
    var name: String
}
