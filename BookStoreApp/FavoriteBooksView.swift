//
//  FavoriteBooksView.swift
//  BookStoreApp
//
//  Created by Alex on 08.12.2023.
//

import SwiftUI

struct FavoriteBooksView: View {
    let books: [Book]
    let columns = [ 
        GridItem(.adaptive(minimum: 300, maximum: 700))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(books) { book in
                        HStack {
                            AsyncImage(url: book.coverImageURL) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 96, height: 142)
                                } else if phase.error != nil {
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(.secondary)
                                    Text("Image loading error.")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 96, height: 142)
                            
                            VStack(alignment: .leading) {
                                Text(book.category)
                                    .foregroundStyle(.white.opacity(0.6))
                                    .font(.subheadline)
                                    .padding(.top)
                                
                                Text(book.title)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                    .padding(.top, 5)
                                
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundStyle(.white)

                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Button {
                                    // delete from favourites action
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.white)
                                }
                                .padding()
                                
                                Spacer()
                            }
                        }
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 8))
                        .shadow(radius: 1)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                    }
                }
            }
            .navigationTitle("Favorite books")
            .navigationBarTitleDisplayMode(.inline)
            // back to DetailView
//            .navigationDestination(for: Book.self) { selectedBook in
//                DetailView(book: selectedBook)
//            }
        }
    }
}

#Preview {
    FavoriteBooksView(books: [Book(
        title: "The Lord of the Rings",
        author: "J.R.R. Tolkien",
        category: "Fantasy",
        rating: 4.53,
        publishYear: 1954,
        numberOfPages: 1193,
        coverImageURL: URL(string: "https://covers.openlibrary.org/b/id/258027-M.jpg")!,
        description: "When Mr. Bilbo Baggins of Bag End.."
    ), Book(
        title: "A Cares of Twilight",
        author: "L.K. Hamilton",
        category: "Romance",
        rating: 4.53,
        publishYear: 1954,
        numberOfPages: 1193,
        coverImageURL: URL(string: "https://covers.openlibrary.org/b/id/861936-M.jpg")!,
        description: ""
    )])
}
