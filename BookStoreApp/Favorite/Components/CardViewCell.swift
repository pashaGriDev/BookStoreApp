//
//  CardViewCell.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct CardViewCell: View {
    private let url: URL
    private let coverId: Int
    private let title: String
    private let author: String
    private let action: () -> Void
    
    private let height: CGFloat = 140.0
    
    
    var body: some View {
        CacheAsyncImage(
            url: .createUrlBy(
                id: coverId
            )
        ){ phase in
            switch phase {
            case .empty:
                HStack {
                    ProgressView()
                        .progressViewStyle(
                            CircularProgressViewStyle(tint: .gray))
                }
            case .success(let image):
                CardDescriptionView(with: title, author, image, and: action)
                
            case .failure(let error):
                ErrorView(error: error)
            @unknown default:
                Image(systemName: "questionmark")
            }
        }
        .frame(height: height)
    }
    
    init(
        url: URL = URL(string: "https://covers.openlibrary.org/b/id/258027-M.jpg")!,
        coverId: Int = 0,
        title: String = "Wuthering Heights",
        author: String = "Taylor Swift",
        action: @escaping () -> Void = {}
    ) {
        self.url = url
        self.coverId = coverId
        self.title = title
        self.author = author
        self.action = action
    }
}

#Preview {
    CardViewCell()
}
