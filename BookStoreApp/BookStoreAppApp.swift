//
//  BookStoreAppApp.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 03.12.23.
//

import SwiftUI

@main
struct BookStoreAppApp: App {
    @AppStorage("isOnboarding") var isOnboarding = false
    @StateObject var modelData: ModelData = .init()
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                ContentView()
                    .environmentObject(modelData)
                    .onAppear {
                        modelData.loadFavoritData()
                    }
            } else {
                OnboardingView($isOnboarding)
            }
        }
    }
}

