//
//  Network.swift
//  BookStoreApp
//
//  Created by stimLite on 06.12.2023.
//

import Foundation


class Network <T: Service> {
    private let urlSession: URLSession
    private let decoder: JSONDecoder
    
    init(
        urlSession: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.urlSession = urlSession
        self.decoder = decoder
    }
    
    //MARK: - await/async
    func request(service: T) async throws -> (Data, URLResponse) {
        return try await call(service.urlRequest)
    }
    
    func request <U: Decodable>(service: T, model: U.Type) async throws -> U {
        let (data, _) = try await call(service.urlRequest)
        print(data)
        return try decoder.decode(model.self, from: data)
    }
}

extension Network {
    private func call ( _ request: URLRequest ) async throws -> (Data, URLResponse) {
        return try await urlSession.data(for: request)
    }
}
