//
//  Network.swift
//  BookStoreApp
//
//  Created by stimLite on 06.12.2023.
//

import Foundation


class Network <T: Service> {
    private let urlSession = URLSession.shared
    private let decoder = JSONDecoder()
    
    init() { }
    
    func request(service: T, comlition: @escaping (Result<Data, Error>) -> Void) {
        call(service.urlRequst, complition: comlition)
    }
    
    func request <U: Decodable>(service: T, model: U.Type, complition: @escaping (U) -> Void) {
        call(service.urlRequst) { result in
            switch result {
            case .success(let success):
                if let objc = try? self.decoder.decode(model.self, from: success) {
                    print(objc)
                    complition(objc)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension Network {
    private func call (_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, complition: @escaping (Result<Data, Error>) -> Void) {
        urlSession.dataTask(with: request) { data, _, error in
            if let error {
                deliverQueue.async {
                    complition(.failure(error))
                }
            }
            
            if let data {
                deliverQueue.async {
                    complition(.success(data))
                }
            }
        }
    }
}
