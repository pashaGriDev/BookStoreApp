//
//  DetailView.swift
//  BookStoreApp
//
//  Created by Alex on 05.12.2023.
//

import SwiftUI

struct DetailView: View {
    let book: MockBook
    @State private var isFavourite = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(book.title)
                    .font(.largeTitle)
                
                HStack {
                    AsyncCoverImage(url: book.coverImageURL, cornerRadius: 8)
                        .frame(maxWidth: 138, maxHeight: 214)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Author: \(book.author)")
                            .padding(.bottom, 5)
                        Text("Category: \(book.category)")
                            .padding(.bottom, 5)
                        Text("Rating: \(book.rating.formatted())/5")
                            .padding(.bottom, 16)
                        
                        ButtonView(
                            title: "Add to list",
                            background: .secondary,
                            foreground: .black,
                            action: {}
                        )
                        
                        ButtonView(
                            title: "Read",
                            background: .black,
                            foreground: .white,
                            action: {}
                        )
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
                        
                        Text(book.description)
                            .font(.system(.subheadline, design: .serif))
                            .padding(.bottom, 22)
                        
                        Text("Number of pages: \(book.numberOfPages)")
                            .font(.callout)
                        
                        Text("Publish year: \(book.publishYear)")
                            .font(.callout)
                    }
                    .padding()
                }
            }
            .navigationTitle(book.category)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isFavourite.toggle()
                    // another action..
                } label: {
                    Image(systemName: isFavourite ? "heart.fill" : "heart")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    DetailView(book: MockBook.getBook())
}