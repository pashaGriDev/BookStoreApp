//
//  AsyncCoverImage.swift
//  BookStoreApp
//
//  Created by Alex on 09.12.2023.
//

import SwiftUI

struct AsyncCoverImage: View {
    let url: URL
    let cornerRadius: CGFloat
    
    init(url: URL, cornerRadius: CGFloat = 0) {
        self.url = url
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: cornerRadius))
            } else if phase.error != nil {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.secondary)
                Text("Image loading error.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    AsyncCoverImage(url: MockBook.getBook().coverImageURL)
}
