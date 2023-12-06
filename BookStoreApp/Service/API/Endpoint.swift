//
//  Endpoint.swift
//  BookStoreApp
//
//  Created by stimLite on 05.12.2023.
//

import Foundation


enum Endpoint {
    
}

extension Endpoint: Service {
    var baseURL: String {
        return "https://openlibrary.org/"
    }
    
    var path: String {
        return ""
    }
    
    var task: Task {
        return .requstParametr(parameters: ["str": "str"])
    }
    
    var method: ServiceMethod {
        return .get
    }
    
    
}
