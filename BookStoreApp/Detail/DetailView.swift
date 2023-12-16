//
//  DView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct DetailView: View {
    private let id: String
    private let author: String
    private var item: DetailBookModel
    
    enum Drawing {
        static let padding: CGFloat = 12.0
        static let imageWidth: CGFloat = 137.0
        static let imageHeight: CGFloat = 210.0
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
                    .frame(
                        width: Drawing.imageWidth,
                        height: Drawing.imageHeight
                    )
                    
                    Spacer()
                    
                    DescriptionSideDetailView(
                        author: author,
                        rating: 3.5,
                        addAction: {
                            // !!!: - add Button
                            print("add button tapped")
                        },
                        readAction: {
                            // !!!: - read Button
                            print("read button tapped")
                        }
                    )
                    
                    Spacer()
                }
                .padding(.horizontal, Drawing.padding)
                
                
                DescriptionDetailView(item.description)
                
                Spacer()
                
            }
            .navigationTitle("Detail Screen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isFavourite.toggle()
                    //!!!: - like action
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
        DetailView(item: DetailBookModel(title: "", key: "", description: ""))
    }
}

//let detail: DetailBookModel = .init(
//    title: "Taylor Swift",
//    key: "123",
//    description: "Wuthering Heights is an 1847 novel by Emily Brontë, initially published under the pseudonym Ellis Bell. It concerns two families of the landed gentry living on the West Yorkshire moors, the Earnshaws and the Lintons, and their turbulent relationships with Earnshaw's adopted son, Heathcliff. The novel was influenced by Romanticism and Gothic fiction.",
//    subjectTimes: ["1984"]
//)
