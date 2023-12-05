//
//  Service.swift
//  BookStoreApp
//
//  Created by stimLite on 05.12.2023.
//

import Foundation


enum ServiceMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var method: ServiceMethod { get }
}

extension Service {
    public var urlRequst: URLRequest {
        guard let url = url else { fatalError("URL not be open") }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
        
    }
    
    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        return urlComponents?.url
    }
}
