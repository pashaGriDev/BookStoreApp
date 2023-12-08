//
//  SearchBar.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 07.12.2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack{
            TextField("Search title/author/ISBN no", text: $searchText)
                .padding(7)
                .padding(.leading, 25)
                .background(Color(red: 222 / 255, green: 222 / 255, blue: 222 / 255, opacity: 1.0))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.leading, 20)
                .onTapGesture {
                    self.isEditing = true
                }
            
            Menu() {
                Button("Sort by 1", action: sort1)
                Button("Sort by 2", action: sort1)
                Button("Sort by 3", action: sort1)
            }label: {
                Image("filter")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.trailing, 20)
        }
    }
    
    func sort1() { }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
