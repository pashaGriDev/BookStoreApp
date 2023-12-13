//
//  CategoryItemView.swift
//  BookStoreApp
//
//  Created by Alex on 13.12.2023.
//

import SwiftUI

struct CategoryItemView: View {
    let title: String
    
    var body: some View {
        ZStack {
            Image(systemName: "photo") // temp
                .resizable()
                .scaledToFill()
                .opacity(0.2)
                .background(.gray.opacity(0.4))
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .clipShape(.rect(cornerRadius: 5))   
        .padding([.leading, .trailing])
    }
}

#Preview {
    CategoryItemView(title: "Fantasy")
}
