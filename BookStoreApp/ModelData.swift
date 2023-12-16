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
    private var defaultCategory: SubjectCategory? = nil
    
    // Detail view properties
    @Published var detailInfo: MyDetailModel? = nil
    @Published var isDetailInfoLoading: Bool = false
    private var detailInfoLastBookKey: String?
    private var isLastKeyNil: Bool {
        return detailInfoLastBookKey == nil
    }
    
    // MARK: - Private properties
    private let network: Network<Endpoint> = .init()
    
    func getSubject(category: SubjectCategory = .love) async {
        guard defaultCategory != category else { return }
        
        defaultCategory = category
        
        do {
            let subj = try await network.request(service: .subject(category), model: SubjectsModel.self)
            
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
    
    @MainActor func getDetailDataBy(key: String) async {
        // проверка совпадает ли последний запрос.
        guard !isSame(detailInfoLastBookKey, and: key) else {
            isDetailInfoLoading.toggle()
            return
        }
        
        do {
            let result = try await network.request(service: .getDetailByKey(key), model: DetailBookModel.self)
            
            detailInfo = .init(
                title: result.title,
                key: result.key,
                description: result.description,
                coversId: result.covers.first ?? 0
            )
            
            detailInfoLastBookKey = key
            isDetailInfoLoading.toggle()
            
            
        } catch {
            // можно обработать ошибку, например показать алерт
            await getDetailDataBy2(key: key)
            print(error.localizedDescription)
        }
    }
    
    @MainActor func getDetailDataBy2(key: String) async {
        // проверка совпадает ли последний запрос.
        guard !isSame(detailInfoLastBookKey, and: key) else {
            isDetailInfoLoading.toggle()
            return
        }
        
        do {
            let result = try await network.request(service: .getDetailByKey(key), model: DetailBookModel2.self)
            
            detailInfo = .init(
                title: result.title,
                key: result.key,
                description: result.description.value,
                coversId: result.covers.first ?? 0
            )
            
            detailInfoLastBookKey = key
            isDetailInfoLoading.toggle()
            
            
        } catch {
            // можно обработать ошибку, например показать алерт
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Methods
}

private extension ModelData {
    /// Если nil то false
    func isSame(_ keyOne: String?,and keyTwo: String) -> Bool {
        guard let keyOne else { return false }
        return keyOne == keyTwo
    }
}
