//
//  BookCellView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 14.12.23.
//

import SwiftUI

struct BookCellView: View {
    let item: WorksModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // тут будет кавер самой книги, это временное решение
            Image("category_\(Int.random(in: 1...4))")
                .resizable()
                .scaledToFill()
                .frame(width: 176, height: 230) // magic numbers
                .clipShape(.rect(cornerRadius: 8))
                .shadow(radius: 2)
            
            VStack(alignment: .leading) {
                Text("Category")
                    .font(.caption)
                    .foregroundColor(.white)
                
                Text(item.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                Text("Author name")
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
    BookCellView(item: mockWork)
}
