//
//  MainSearchView.swift
//  BookStoreApp
//
//  Created by stimLite on 16.12.2023.
//

import SwiftUI

struct MainSearchView: View {
    @Binding var searchText: String
    @Binding var isSearch: Bool
    let action: () -> Void
    
    var body: some View {
        
        HStack {
            TextField("Search books", text: $searchText)
                .frame(height: 35)
            Button {
                action()
            } label: {
                if !isSearch {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                } else {
                    Text("Cancel")
                        .foregroundStyle(.blue)
                }
            }
            .frame(width: !isSearch ? 35 : .infinity, height: 35)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MainSearchView(searchText: .constant(""), isSearch: .constant(true), action: {})
}
