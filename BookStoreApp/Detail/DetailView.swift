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
    
    @State private var item: DetailBookModel?
    @State private var isLoading = false
    
    enum Drawing {
        static let padding: CGFloat = 12.0
        static let imageWidth: CGFloat = 137.0
        static let imageHeight: CGFloat = 210.0
    }
    
    @State private var isFavourite = false
    
    var body: some View {
        VStack {
            if isLoading {
                DetailViewImp(
                    author: author,
                    item: item,
                    isFavourite: $isFavourite
                )
            } else {
                ProgressView()
            }
        }
        .onAppear {
            print("Получить данные")
            sleep(3)
            // передать ИД в запрос
            self.item = mockDetailBook
        }
    }
    
    init(
        id: String = "123",
        author: String = "Taylor Swift",
        item: DetailBookModel?
    ) {
        self.id = id
        self.author = author
        self.item = item
    }
}

#Preview {
    NavigationView {
        DetailView(item: nil)
    }
}


struct DetailViewImp: View {
    // сделать инициализатор
    
     let author: String
     var item: DetailBookModel?
    
    @Binding var isFavourite: Bool
    
    enum Drawing {
        static let padding: CGFloat = 12.0
        static let imageWidth: CGFloat = 137.0
        static let imageHeight: CGFloat = 210.0
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("**\(item?.title ?? "Unknown")**")
                    .font(.title)
                
                HStack {
                    CacheAsyncImage(
                        url: .createUrlBy(
                            id: item?.firstImageCover ?? 0
                        )
                    ) { phase in
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
                
                DescriptionDetailView(item?.description ?? "No description")
                
                Spacer()
            }
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
