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
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                ContentView()
            } else {
                OnboardingView($isOnboarding)
            }
        }
    }
}
