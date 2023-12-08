//
//  DetailView.swift
//  BookStoreApp
//
//  Created by Alex on 05.12.2023.
//

import SwiftUI

struct Book {
    var title: String
    var author: String
    var category: String
    var rating: Double
    var publishYear: Int
    var numberOfPages: Int
    var coverImageURL: URL
    var description: String
}

struct DetailView: View {
    let book: Book
    @State private var isFavourite = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(book.title)
                    .font(.largeTitle)
                
                HStack {
                    AsyncImage(url: book.coverImageURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                        } else if phase.error != nil {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text("Image loading error.")
                                .font(.caption)
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(maxWidth: 138, maxHeight: 214)
                    .padding(.trailing, 8)
                    
                    VStack(alignment: .leading) {
                        Text("Author: \(book.author)")
                            .padding(.bottom, 5)
                        Text("Category: \(book.category)")
                            .padding(.bottom, 5)
                        Text("Rating: \(book.rating.formatted())/5")
                            .padding(.bottom, 16)
                        
                        ButtonView(title: "Add to list", background: .secondary, foreground: .black, action: {})
                        
                        ButtonView(title: "Read", background: .black, foreground: .white, action: {})
                    }
                    .frame(maxHeight: 214)
                }
                
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
    DetailView(book: Book(
        title: "The Lord of the Rings",
        author: "J.R.R. Tolkien",
        category: "Fantasy",
        rating: 4.53,
        publishYear: 1954, 
        numberOfPages: 1193,
        coverImageURL: URL(string: "https://covers.openlibrary.org/a/olid/OL26320A.jpg")!,
        description: "When Mr. Bilbo Baggins of Bag End announced that he would shortly be celebrating his eleventy-first birthday with a party of special magnificence, there was much talk and excitement in Hobbiton."
    ))
}
