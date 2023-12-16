//
//  DView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct DView: View {
    private let id: String
    private let author: String
    private var item: DetailBookModel
    
    enum Drawing {
        static let padding: CGFloat = 12.0
    }
    
    @State private var isFavourite = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("**\(item.title)**")
                    .font(.title)
                
                HStack {
                    CacheAsyncImage(url: URL(string: "https://covers.openlibrary.org/b/id/258027-M.jpg")!) { phase in
                        switch phase {
                        case .empty:
                            HStack {
                                ProgressView()
                                    .progressViewStyle(
                                        CircularProgressViewStyle(tint: .gray))
                            }
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                            
                        case .failure(let error):
                            ErrorView(error: error)
                        @unknown default:
                            Image(systemName: "questionmark")
                        }
                    }
                    .frame(width: 137, height: 210)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Author: \(author)")
                            .padding(.bottom, 5)
                        
                        Text("Rating: \(3)/5")
                            .padding(.bottom, 16)
                        
                        ButtonView(
                            title: "Add to list",
                            background: .secondary,
                            foreground: .black,
                            action: {
                                print("add button tapped")
                            }
                        )
                        
                        ButtonView(
                            title: "Read",
                            background: .primary,
                            foreground: .white,
                            action: {
                                print("read button tapped")
                            }
                        )
                    }
                    
                    
                    Spacer()
                }
                .padding(.horizontal, Drawing.padding)
                
                
                VStack(alignment: .leading) {
                    Text("Description:")
                        .font(.headline)
                        .padding(.bottom, Drawing.padding)
                        .padding(.horizontal, Drawing.padding)
                    
                    Text(item.description)
                        .font(.system(.subheadline, design: .serif))
                        .padding(.horizontal, Drawing.padding)
                }
                .padding(.top, Drawing.padding)
                
                Spacer()
                
            }
            .navigationTitle("title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isFavourite.toggle()
                    // like action
                    print("Favourite button tapped!")
                } label: {
                    Image(
                        systemName: isFavourite
                        ? "heart.fill"
                        : "heart"
                    )
                }
                .foregroundStyle(.black)
            }
        }
    }
    
    init(
        id: String = "123",
        author: String = "Taylor Swift",
        item: DetailBookModel
    ) {
        self.id = id
        self.author = author
        self.item = item
    }
}

#Preview {
    NavigationView {
        DView(item: detail)
    }
}

let detail: DetailBookModel = .init(
    title: "Taylor Swift",
    key: "123",
    description: "Wuthering Heights is an 1847 novel by Emily Brontë, initially published under the pseudonym Ellis Bell. It concerns two families of the landed gentry living on the West Yorkshire moors, the Earnshaws and the Lintons, and their turbulent relationships with Earnshaw's adopted son, Heathcliff. The novel was influenced by Romanticism and Gothic fiction.",
    subjectTimes: ["1984"]
)
