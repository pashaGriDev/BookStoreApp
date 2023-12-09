//
//  MockBook.swift
//  BookStoreApp
//
//  Created by Alex on 09.12.2023.
//

import Foundation

struct MockBook: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var author: String
    var category: String
    var rating: Double
    var publishYear: Int
    var numberOfPages: Int
    var coverImageURL: URL
    var description: String
}

extension MockBook {
    static func getBook() -> MockBook {
        return MockBook(
            title: "The Lord of the Rings",
            author: "J.R.R. Tolkien",
            category: "Fantasy",
            rating: 4.53,
            publishYear: 1954,
            numberOfPages: 1193,
            coverImageURL: URL(string: "https://covers.openlibrary.org/b/id/258027-M.jpg")!,
            description: "When Mr. Bilbo Baggins of Bag End announced that he would shortly be celebrating his eleventy-first birthday with a party of special magnificence, there was much talk and excitement in Hobbiton."
        )
    }
}
