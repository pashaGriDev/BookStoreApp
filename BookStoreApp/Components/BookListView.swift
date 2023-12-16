//
//  BookListView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct BookListView: View {
    // сделать инициализатор
    // структура должна приниматься массив данных для цикла
    
    var body: some View {
        ScrollView {
            ForEach(0...2, id: \.self) { _ in
                NavigationLink {
                    Text("Show detail view!")
                } label: {
                    CardViewCell() {
                        print("Close card!")
                    }
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    BookListView()
}
