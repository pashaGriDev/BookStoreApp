//
//  LoginView.swift
//  BookStoreApp
//
//  Created by Alex on 14.12.2023.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("username") private var name = ""
    @AppStorage("userLastname") private var lastName = ""
    @AppStorage("avatar") private var avatar = "wizard"
    @State private var isDark = false
    
    let avatars = ["wizard", "knight", "boy", "girl", "sage"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Enter your details") {
                    TextField("Your name..", text: $name)
                    TextField("Last name..", text: $lastName)
                    
                    Picker("Choose avatar", selection: $avatar) {
                        ForEach(avatars, id: \.self) { avatar in
                            Text(avatar.capitalized)
//                                .tag(avatar)
                        }
                    }
                }
                
                Section("Change application theme") {
                    Toggle("Dark theme", isOn: $isDark)
                }
                
                Section {
                    Button("Save") {
                        dismiss()
                    }
                    .disabled(isValid())
                }
            }
            .navigationTitle("Account menu")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark") {
                        dismiss()
                        name = ""
                        lastName = ""
                    }
                }
            }
        }
    }
    
    private func isValid() -> Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty && lastName.trimmingCharacters(in: .whitespaces).isEmpty {
            return true
        }
        return false
    }
}

#Preview {
    LoginView()
}
