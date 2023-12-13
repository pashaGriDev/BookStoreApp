//
//  BookсardRowView.swift
//  BookStoreApp
//
//  Created by Alex on 09.12.2023.
//

import SwiftUI

struct BookсardRowView: View {
    @Environment(\.colorScheme) var colorScheme
    let book: MockBook
    
    var body: some View {
        HStack {
            AsyncCoverImage(url: book.coverImageURL)
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
        .background(
            colorScheme == .dark
                ? Color(UIColor.secondarySystemBackground)
                : .black
        )
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 1)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
    }
}

#Preview {
    BookсardRowView(book: MockBook.getBook())
}
