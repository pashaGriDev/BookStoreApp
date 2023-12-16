//
//  ModelData.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 15.12.23.
//

import Foundation

class ModelData: ObservableObject {
    @Published var items: [WorksModel] = []
    @Published var searchItem: SubjectsModel?
    @Published var isLoading: Bool = false
    @Published var isSearch: Bool = false
    
    private let network: Network<Endpoint> = .init()
    
    func getSubject() async {
        guard items.isEmpty else { return }
        
        do {
            let subj = try await network.request(service: .subject(.love), model: SubjectsModel.self)

            await MainActor.run {
                items = subj.works
                isLoading.toggle()
            }
            
        } catch {
            // можно обработать ошибку, например показать алерт
            print(error.localizedDescription)
        }
    }
    
    func getSearchItems(search: String) async {
//        print(search)
//        guard items.isEmpty else { return }
        do {
            let subj = try await network.request(service: .search(search, "10"), model: SearchModel.self)
            print(type (of: subj))
            await MainActor.run {
//                items = subj.works
                isSearch.toggle()
            }
            
        } catch {
            // можно обработать ошибку, например показать алерт
            print(error.localizedDescription)
        }
    }
}
