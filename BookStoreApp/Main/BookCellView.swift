//
//  BookCellView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 14.12.23.
//

import SwiftUI

struct BookCellView: View {
//    let item: WorksModel
    let item: BookModelData
    
    enum Drawing {
        static let padding: CGFloat = 12.0
        static let imageWidth: CGFloat = 176.0
        static let imageHeight: CGFloat = 210.0
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // тут будет кавер самой книги, это временное решение
//            Image("category_\(Int.random(in: 1...4))")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 176, height: 230) // magic numbers
//                .clipShape(.rect(cornerRadius: 8))
//                .shadow(radius: 2)
            CacheAsyncImage(
                url: .createUrlBy(
                    id: item.coverId ?? 0
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
            
            VStack(alignment: .leading) {
                Text(item.category)
                    .font(.caption)
                    .foregroundColor(.white)
                
                Text(item.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                Text(item.author)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 176, alignment: .leading)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0.9), .black.opacity(0)]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .clipShape(.rect(cornerRadius: 8))
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    BookCellView(item: BookModelData(title: "", key: "", category: "", author: ""))
}
