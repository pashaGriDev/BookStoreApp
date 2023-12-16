//
//  DetailView.swift
//  BookStoreApp
//
//  Created by Alex on 05.12.2023.
//

import SwiftUI

//class DetailViewModel: ObservableObject {
//    @Published var item: DetailBookModel?
//    var bookId: String = .init()
//    
//    
//    func getDetail() async {
//        sleep(3)
//        item = mockDetailBook
//    }
//}

/*
 init(
     url: URL = URL(string: "https://covers.openlibrary.org/b/id/258027-M.jpg")!,
     title: String = "Wuthering Heights",
     author: String = "Taylor Swift",
     action: @escaping () -> Void = {}
 ) {
     self.url = url
     self.title = title
     self.author = author
     self.action = action
 }
 */

struct DetailView: View {
    private let id: String
    private let author: String
    private var item: DetailBookModel
    
    init(
        id: String = "123",
        author: String = "Taylor Swift",
        item: DetailBookModel
    ) {
        self.id = id
        self.author = author
        self.item = item
    }
    
    let book: MockBook = .getBook()
    
    @State private var isFavourite = false
    
    var body: some View {
        
        VStack {
            Text(book.title)
                .font(.largeTitle)
            
            HStack {
                AsyncCoverImage(url: book.coverImageURL, cornerRadius: 8)
                    .frame(maxWidth: 138, maxHeight: 214)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Author: \(author)")
                        .padding(.bottom, 5)
//                    Text("Category: \(book.category)")
//                        .padding(.bottom, 5)
                    Text("Rating: \(3)/5")
                        .padding(.bottom, 16)
                    
                    ButtonView(
                        title: "Add to list",
                        background: .secondary,
                        foreground: .black,
                        action: {}
                    )
                    
//                    ButtonView(
//                        title: "Read",
//                        background: .primary,
//                        foreground: colorScheme == .dark ? .black : .white,
//                        action: {}
//                    )
                }
                
                Spacer()
            }
            .padding([.leading, .trailing])
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Description:")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    Text(item.description)
                        .font(.system(.subheadline, design: .serif))
                        .padding(.bottom, 22)
                    
                    Text("Number of pages: \(222)")
                        .font(.callout)
                    
                    Text("Publish year: \(item.subjectTimes.first ?? "1984")") // поправить
                        .font(.callout)
                }
                .padding()
            }
        }
        .navigationTitle("title")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                isFavourite.toggle()
                // another action..
            } label: {
                Image(systemName: isFavourite ? "heart.fill" : "heart")
//                    .foregroundStyle(colorScheme == .dark ? .white : .black)
            }
        }
    }
}

//#Preview {
//    NavigationView {
//        DetailView(item: detail)
//    }
//}

