//
//  Endpoint.swift
//  BookStoreApp
//
//  Created by stimLite on 05.12.2023.
//

import Foundation


enum Endpoint {
    case recent
}

extension Endpoint: Service {
    var baseURL: String {
        return "https://openlibrary.org"
    }
    
    var path: String {
        switch self {
        case .recent:
            return "/recentchanges.json"
        }
        
    }
    
    var task: Task {
        switch self {
        case .recent:
            return .requst
        }
    }
    
    var method: ServiceMethod {
        return .get
    }
    
    
}
