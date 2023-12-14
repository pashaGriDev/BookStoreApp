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
    case getDetailByKey(String)
    case getRatingByKey(String)
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
        case let .getDetailByKey(id):
            return "\(id).json"
        case let .getRatingByKey(id):
            return "\(id)/ratings.json"
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
        case .getDetailByKey(_):
            return .request
        case .getRatingByKey(_):
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
