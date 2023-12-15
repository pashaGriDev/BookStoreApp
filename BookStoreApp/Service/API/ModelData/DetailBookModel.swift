//
//  DetailBookModel.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 14.12.23.
//

import Foundation

// MARK: - Welcome
struct DetailBookModel: Codable {
    let title, key: String
    let authors: [Author]
    let type: TypeClass
    let description: String
    let covers: [Int]
    let firstSentence: Created
    let firstPublishDate: String
    let links: [Link]
    let subjectPlaces, subjects, subjectPeople, subjectTimes: [String]
    let excerpts: [Excerpt]
    let latestRevision, revision: Int
    let created, lastModified: Created

    enum CodingKeys: String, CodingKey {
        case title, key, authors, type, description, covers
        case firstSentence = "first_sentence"
        case firstPublishDate = "first_publish_date"
        case links
        case subjectPlaces = "subject_places"
        case subjects
        case subjectPeople = "subject_people"
        case subjectTimes = "subject_times"
        case excerpts
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }
}

// MARK: - Author
struct Author: Codable {
    let author, type: TypeClass
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let key: String
}

// MARK: - Created
struct Created: Codable {
    let type, value: String
}

// MARK: - Excerpt
struct Excerpt: Codable {
    let excerpt, comment: String
    let author: TypeClass
}

// MARK: - Link
struct Link: Codable {
    let title: String
    let url: String
    let type: TypeClass
}
