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

enum Task {
    case requstParametr(parameters: [String: Any])
    case requst
}

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var task: Task { get }
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
        if let paramerItem {
            urlComponents?.queryItems = paramerItem
        }
        return urlComponents?.url
    }
    
    private var paramerItem: [URLQueryItem]? {
        var items = [URLQueryItem]()
        switch task {
        case .requstParametr(let parameters):
            items = parameters.map({ URLQueryItem(name: $0, value: $1 as? String) })
        case .requst:
            items = [URLQueryItem]()
        }
        return items
    }
}
