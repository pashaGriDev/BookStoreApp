//
//  SearchBar.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 13.12.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @Binding var sortIsActive: Bool
    var cancelButton: () -> Void

    @State private var isEditing = false
    
    var body: some View {
        HStack{
            TextField("Search title/author/ISBN no", text: $searchText)
                .frame(height: 35)
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
                                cancelButton()
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
                Picker("Sort", selection: $sortIsActive) {
                    Text("Sort from A to Z")
                        .tag(true)
                    Text("Sort from Z to A")
                        .tag(false)
                }
            }label: {
                Image("filter")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), sortIsActive: .constant(false), cancelButton: {})
}
