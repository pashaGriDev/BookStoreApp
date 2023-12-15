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
//        do {
//            let subj = try await service.request(service: .subject(.love), model: SubjectsModel.self)
//            
//            await MainActor.run {
//                items = subj.works
//            }
//            print(items.count)
//        } catch {
//            print(error.localizedDescription, "<---")
//        }
        
        do {
            let result = try await service.request(
                service: .getRatingByKey("/works/OL21177W"),
                model: RatingsModel.self
            )
            let result2 = try await service.request(
                service: .getDetailByKey("/works/OL21177W"),
                model: DetailBookModel.self
            )
            print(result.summary.average)
            print(result2.title)
        } catch {
            print(error.localizedDescription, "<---")
        }
    }
}
