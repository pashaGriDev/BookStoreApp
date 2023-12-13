//
//  NetworkGCD.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 13.12.23.
//

import Foundation

/// Дополнительный сетевой класс если первый работать откажется
/// и как небольшой пример реализации сетевого класса

class NetworkGCD <T: Service> {
    private let urlSession = URLSession.shared
    private let decoder = JSONDecoder()
    
    init() { }
    
    func request(service: T, completion: @escaping (Result<Data, Error>) -> Void) {
        call(service.urlRequest, completion: completion)
    }
    
    func request <U: Decodable>(service: T, model: U.Type, completion: @escaping (U) -> Void) {
        call(service.urlRequest) { result in
            switch result {
            case .success(let success):
                if let objc = try? self.decoder.decode(model.self, from: success) {
                    print(objc)
                    completion(objc)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension NetworkGCD {
    private func call (_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data, Error>) -> Void) {
        urlSession.dataTask(with: request) { data, _, error in
            if let error {
                deliverQueue.async {
                    completion(.failure(error))
                }
            }
            
            if let data {
                deliverQueue.async {
                    completion(.success(data))
                }
            }
        }
    }
}
