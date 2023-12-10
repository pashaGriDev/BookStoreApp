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
        Task {
//            let test = try await service.request(service: .recent, model: [RecentModel].self)
//            let search = try await service.request(service: .search("Happy Reading", "10"), model: SearchModel.self)
            let subj = try await service.request(service: .subject(.love), model: SubjectsModel.self)
            print(subj)
        }
    }
}
