//
//  AccountView.swift
//  BookStoreApp
//
//  Created by Михаил Данилин on 12.12.2023.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("username") private var name = ""
    @AppStorage("userLastname") private var lastName = ""
    @AppStorage("avatar") private var avatar = "wizard"
    @State private var isShowingLoginView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(avatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                    .clipShape(Circle())
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: -2, y: 5)
                    .padding(.top, 50)
                
                Text(name.isEmpty && lastName.isEmpty
                        ? "Guest"
                        : "\(name) \(lastName)"
                )
                    .font(.title)
                    .padding()
                
                Spacer()
                
                ButtonView(title: "Login", background: .primary, foreground: .green) {
                    isShowingLoginView.toggle()
                }
                .padding()
                
                ButtonView(title: "Log out", background: .secondary, foreground: .white) {
                    name = ""
                    lastName = ""
                }
                
                Spacer()
            }
            .navigationBarTitle("Account", displayMode: .inline)
            .sheet(isPresented: $isShowingLoginView) {
                LoginView()
            }
        }
    }
}

#Preview {
    AccountView()
}
