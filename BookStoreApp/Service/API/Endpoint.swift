//
//  Endpoint.swift
//  BookStoreApp
//
//  Created by stimLite on 05.12.2023.
//

import Foundation


enum Endpoint {
    case search(String, String?)
    case recent
    case subject(SubjectCategory)
}

extension Endpoint: Service {
    var baseURL: String {
        return "https://openlibrary.org"
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search.json"
        case .recent:
            return "/recentchanges.json"
        case let .subject(category):
            return "/subjects/\(category.rawValue).json"
        }
    }
    
    var task: NetworkTask {
        switch self {
        case let .search(q, limit):
            return .requestParameter(parameters: ["q": q, "limit": limit])
        case .recent:
            return .request
        case .subject(_):
            return .request
        }
    }
    
    var method: ServiceMethod {
        return .get
    }
}

enum SubjectCategory: String {
    case love = "love"
    case drama = "drama"
}
