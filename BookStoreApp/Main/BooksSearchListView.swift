//
//  BooksSearchListView.swift
//  BookStoreApp
//
//  Created by stimLite on 16.12.2023.
//

import SwiftUI

struct BooksSearchListView: View {
    @Binding var booksList: [DocsModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach($booksList.indices, id: \.self) { index in
                    NavigationLink {
                        Text("Detail view \(booksList[index].key)")
                    } label: {
//                        BookCellView(item: booksList[index])
                    }
                }
            }
        }
    }
}

#Preview {
    BooksSearchListView(
        booksList: .constant(
            [DocsModel(
                key: "",
                type: "",
                seed: [""],
                title: "",
                title_suggest: "",
                title_sort: "",
                edition_count: 0,
                edition_key: [""],
                publish_date: [""],
                publish_year: [0],
                first_publish_year: 0,
                number_of_pages_median: nil,
                isbn: [""],
                last_modified_i: 0,
                ebook_count_i: 0,
                ebook_access: "",
                has_fulltext: false,
                public_scan_b: false,
                cover_edition_key: nil,
                cover_i: 0,
                publisher: [""],
                author_key: [""],
                author_name: [""],
                publisher_facet: nil,
                author_facet: nil)]))
}
