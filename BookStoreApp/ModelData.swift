//
//  ModelData.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 15.12.23.
//

import Foundation

class ModelData: ObservableObject {
    
    // MARK: - Public properties
    @Published var items: [WorksModel] = []
    @Published var searchItem: SubjectsModel?
    @Published var isLoading: Bool = false
    @Published var isSearch: Bool = false
    @Published var books: [BookModelData] = []
    @Published var getSearch: [BookModelData] = []
    
    @Published var favoriteBooks: [BookModelData] = []
    
    // MARK: - Private properties
    private let network: Network<Endpoint> = .init()
    
    // MARK: - Network Methods
    func getSubject() async {
        guard books.isEmpty else { return }
        
        do {
            let subj = try await network.request(service: .subject(.love), model: SubjectsModel.self)
            
            let temp: [BookModelData] = subj.works.map{
                .init(title: $0.title,
                      key: $0.key,
                      category: $0.subject.first ?? "",
                      author: $0.authors.first?.name ?? "",
                      coverId: $0.cover_id)
            }

            await MainActor.run {
                self.books = temp
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
            
            let temp: [BookModelData] = subj.docs.map {
                .init(title: $0.title,
                      key: $0.key,
                      category: $0.subject?.first ?? "",
                      author: $0.author_name.first ?? "",
                      coverId: $0.cover_i)
            }
            
            await MainActor.run {
                self.getSearch = temp
                isSearch.toggle()
            }
            
        } catch {
            // можно обработать ошибку, например показать алерт
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Methods
    
}
