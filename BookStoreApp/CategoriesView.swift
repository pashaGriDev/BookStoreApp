//
//  CategoryView.swift
//  BookStoreApp
//
//  Created by Мирсаит Сабирзянов on 07.12.2023.
//

import SwiftUI

struct CategoryView: View {
    var categories = ["Non-fiction", "Classics",
                      "Fantasy", "Young Adult",
                      "Crime", "Horror",
                      "Sci-fi", "Drama",
                      "Folk"]
    
    var imageCategories = ["category_1", "category_2",
                           "category_3", "category_4"]
    
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    SearchBar(searchText: $searchText)
                        .padding(.top)
                    HStack {
                        Text("Categories")
                            .font(.system(size: 25, weight: .regular))
                        Spacer()
                    }
                    .padding()
                    ScrollView(){
                        if searchText.isEmpty{
                            ForEach(0..<categories.count/2 + categories.count % 2, id:\.self) { row in
                                HStack {
                                    CategoryItem(name: categories[row*2], image: imageCategories[(row * 2) % 4])
                                    if categories[safe: row * 2 + 1] != nil {
                                        CategoryItem(name: categories[row*2 + 1], image: imageCategories[(row * 2 + 1) % 4])
                                    } else{
                                        Rectangle()
                                            .colorMultiply(.clear)
                                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100)
                                            .padding()
                                    }
                                }
                            }
                        }
                        else{
                            VStack{
                                ForEach(categories.filter({$0.contains(searchText.uppercased())}), id:\.self){item in
                                    Text(item)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CategoryItem: View{
    
    var name: String
    var image: String
    
    var body: some View{
        NavigationLink(destination: ContentView()) {
                Text(name)
                    .clipShape(Rectangle())
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100)
                    .background(Image(image))
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .cornerRadius(5)
                    .padding()
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


#Preview {
    CategoryView()
}
