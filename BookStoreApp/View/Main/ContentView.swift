//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 03.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        VStack {
            HStack() {
                Text("Top Books")
                Spacer()
                Button("see more") {
                    
                }
                .foregroundStyle(.gray)
                .padding(.trailing, 20)
            }
            .padding(.leading, 20)
            
            HStack {
                Button("This weak"){
                    
                }
                .padding(.all, 8)
                .background(.black)
                .foregroundStyle(.white)
                Spacer()
            }
            .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack (spacing: 16){
                    ForEach(0..<10) { _ in
                        BookCellView()
                            .padding(.vertical)
                    }
                }
            }
            .padding(.leading, 20)
            HStack() {
                Text("Top Books")
                Spacer()
                Button("see more") {
                    
                }
                .foregroundStyle(.gray)
                .padding(.trailing, 20)
            }
            .padding(.leading, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<10) { _ in
                        BookCellView()
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
}

struct BookCellView: View {
    var body: some View {
        VStack {
            ZStack{
                Image("category_4")
                    .resizable()
                    .padding(.horizontal, 44)
                    .padding(.vertical, 11)
                VStack{
                    Spacer()
                    HStack(){
                        VStack (alignment: .leading, spacing: 8){
                            Text("Text")
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                            Text("Text111111111")
                                .lineLimit(2)
                                .font(.system(size: 21).bold())
                                .foregroundStyle(.white)
                            Text("Text")
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                        }
                        .frame(width: 180)
                        .padding(.vertical, 12)
                        .background(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(width: 180)
        .background(.gray)
        .cornerRadius(8)
    }
}

#Preview {
    ContentView()
}
