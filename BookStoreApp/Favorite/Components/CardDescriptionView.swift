//
//  CardDescriptionView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct CardDescriptionView: View {
    private let title: String
    private let author: String
    private let image: Image
    private let action: () -> Void
    
    enum Drawing {
        static let height: CGFloat = 140.0
        static let cornerRadius: CGFloat = 8.0
        static let closeImageName: String = "xmark"
    }
    
    var body: some View {
        HStack {
            image
                .resizable()
                .scaledToFit()
                .frame(height: Drawing.height)
            
            VStack(alignment: .leading) {
                Text("**\(title)**")
                    .font(.title3)
                
                Text(author)
                    .font(.subheadline)
                
                Spacer()
            }
            .foregroundStyle(.white)
            .padding(.vertical)
            
            Spacer()
            
            VStack {
                Button { action() } label: {
                    Image(systemName: Drawing.closeImageName)
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background { Color.black}
        .clipShape(.rect(cornerRadius: Drawing.cornerRadius))
    }
    
    init(
        with title: String,
        _ author: String,
        _ image: Image,
        and action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.author = author
        self.image = image
        self.action = action
    }
}

//#Preview {
//    CardDescriptionView()
//}
