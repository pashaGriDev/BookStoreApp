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

enum NetworkTask {
    case requestParameter(parameters: [String: Any])
    case request
}

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var task: NetworkTask { get }
    var method: ServiceMethod { get }
}

extension Service {
    public var urlRequest: URLRequest {
        guard let url = url else { fatalError("URL not be open") }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
        
    }
    
    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        if let queryItems {
            urlComponents?.queryItems = queryItems
        }
        return urlComponents?.url
    }
    
    private var queryItems: [URLQueryItem]? {
        var items = [URLQueryItem]()
        switch task {
        case .requestParameter(let parameters):
            items = parameters.map({ URLQueryItem(name: $0, value: $1 as? String) })
        case .request:
            items = [URLQueryItem]()
        }
        return items
    }
}
