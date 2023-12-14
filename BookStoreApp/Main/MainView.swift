//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 03.12.23.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewModel()
    
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
                    ForEach(vm.items.indices, id: \.self) { index in
                        BookCellView(item: vm.items[index])
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
                    ForEach(vm.items.indices, id: \.self) { index in
                        BookCellView(item: vm.items[index])
                    }
                }
            }
            .padding(.leading, 20)
        }
        .task {
            await vm.getData()
        }
    }
}

#Preview {
    MainView()
}
