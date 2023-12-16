//
//  MainSearchView.swift
//  BookStoreApp
//
//  Created by stimLite on 16.12.2023.
//

import SwiftUI

struct MainSearchView: View {
    @Binding var searchText: String
    let action: () -> Void
    
    var body: some View {
        
        HStack {
            TextField("Search books", text: $searchText)
                .frame(height: 35)
            Button {
                action()
            } label: {
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .foregroundColor(.black)
            }
            .frame(width: 35, height: 35)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MainSearchView(searchText: .constant(""), action: {})
}
