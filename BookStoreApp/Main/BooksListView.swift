//
//  BooksListView.swift
//  BookStoreApp
//
//  Created by stimLite on 16.12.2023.
//

import SwiftUI

struct BooksListView: View {
    @Binding var booksList: [WorksModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach($booksList.indices, id: \.self) { index in
                    NavigationLink {
                        Text("Detail view \(booksList[index].key)")
                    } label: {
                        BookCellView(item: booksList[index])
                    }
                }
            }
        }
    }
}

#Preview {
    BooksListView(
        booksList:
                .constant([WorksModel(
                key: "",
                title: "",
                edition_count: 0,
                cover_id: 0,
                cover_edition_key: "",
                subject: [""],
                ia_collection: [""],
                lendinglibrary: false,
                printdisabled: false,
                lending_edition: "", lending_identifier: "",
                authors: [AuthorsModel(key: "", name: "")],
                first_publish_year: 0,
                ia: "",
                public_scan: false,
                has_fulltext: false,
                availability:
                    AvailabilityModel(
                        status: "",
                        available_to_browse: false,
                        available_to_borrow: false,
                        available_to_waitlist: false,
                        is_printdisabled: false,
                        is_readable: false,
                        is_lendable: false,
                        is_previewable: false,
                        identifier: "",
                        openlibrary_work: "",
                        openlibrary_edition: "",
                        last_loan_date: nil,
                        is_restricted: false,
                        is_browseable: false)
                )]))
}
