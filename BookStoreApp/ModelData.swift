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
    @Published var books: [BookModelData] = []
    @Published var getSearch: [BookModelData] = []
    
    private let network: Network<Endpoint> = .init()
    
    func getSubject() async {
        guard books.isEmpty else { return }
        
        do {
            let subj = try await network.request(service: .subject(.love), model: SubjectsModel.self)

            await MainActor.run {
                books = subj.works.map{
                    .init(title: $0.title,
                          key: $0.key,
                          category: $0.subject.first ?? "",
                          author: $0.authors.first?.name ?? "")
                }
                isLoading.toggle()
            }
            
        } catch {
            // можно обработать ошибку, например показать алерт
            print(error.localizedDescription)
        }
    }
    
    func getSearchItems(search: String) async {
        do {
            let subj = try await network.request(service: .search(search, "10"), model: SearchModel.self)
            
            await MainActor.run {
                getSearch = subj.docs.map {
                    .init(title: $0.title,
                          key: $0.key,
                          category: $0.subject?.first ?? "",
                          author: $0.author_name.first ?? "")
                }
                isSearch.toggle()
            }
            
        } catch {
            // можно обработать ошибку, например показать алерт
            print(error.localizedDescription)
        }
    }
}
