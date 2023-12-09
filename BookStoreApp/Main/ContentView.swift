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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Test") {
                viewModel.getData()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
