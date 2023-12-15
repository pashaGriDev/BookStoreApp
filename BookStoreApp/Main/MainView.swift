//
//  ContentView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 03.12.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var modelData: ModelData
    
//    @StateObject var vm = MainViewModel()
    @State private var searchText = ""
    @State private var sortIsActive = false
    
    var body: some View {
        SearchBarView(searchText: $searchText, sortIsActive: $sortIsActive)
            .padding(.bottom)
        
        HeadlineView(headline: "Top Books", buttonTitle: "see more", action: {})
        
        HStack(spacing: 16) {
            SwitchButtonView(title: "This Week")
            SwitchButtonView(title: "This Month")
            SwitchButtonView(title: "This Year")
            Spacer()
        }
        .padding([.leading, .bottom])
        
        ScrollView {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(modelData.items.indices, id: \.self) { index in
                        NavigationLink {
                            //
                        } label: {
                            BookCellView(item: modelData.items[index])
                        }
                    }
                }
            }
            
            Divider()
            
            HeadlineView(headline: "Recent Books", buttonTitle: "see more", action: {})
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(modelData.items.indices, id: \.self) { index in
                        NavigationLink {
                            //
                        } label: {
                            BookCellView(item: modelData.items[index])
                        }
                    }
                }
            }
        }
        .task {
            await modelData.getSubject()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ModelData())
}
