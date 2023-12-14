//
//  MainViewModel.swift
//  BookStoreApp
//
//  Created by stimLite on 07.12.2023.
//

import Foundation
import Combine


class MainViewModel: ObservableObject {
    
    @Published var items: [WorksModel] = []
    var service = Network<Endpoint>()
    
    func getData() async {
// let test = try await service.request(service: .recent, model: [RecentModel].self)
// let search = try await service.request(service: .search("Happy Reading", "10"), model: SearchModel.self)
        do {
            let subj = try await service.request(service: .subject(.love), model: SubjectsModel.self)
            
            await MainActor.run {
                items = subj.works
            }
            print(items.count)
        } catch {
            assert(false, "fail")
        }
    }
}
