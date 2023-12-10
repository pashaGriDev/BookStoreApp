//
//  MainViewModel.swift
//  BookStoreApp
//
//  Created by stimLite on 07.12.2023.
//

import Foundation
import Combine


class MainViewModel: ObservableObject {
    
    var service = Network<Endpoint>()
    
    func getData() {
        async {
            let test = try await service.request(service: .recent, model: RecentModel.self)
        }
    }
}
