//
//  AccountView.swift
//  BookStoreApp
//
//  Created by Михаил Данилин on 12.12.2023.
//

import SwiftUI

struct AccountView: View {
    
    @State private var name: String = UserDefaults.standard.string(forKey: "userName") ?? ""
    @State private var surname: String = UserDefaults.standard.string(forKey: "userSurname") ?? ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.top, 50)
            
            if isEditing {
                
                TextField("Имя", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Фамилия", text: $surname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            } else {
                Text("\(name) \(surname)")
                    .font(.title)
            }
            
            Spacer()
            
            if isEditing {
                Button("Сохранить") {
                    UserDefaults.standard.set(name, forKey: "userName")
                    UserDefaults.standard.set(surname, forKey: "userSurname")
                    isEditing = false
                }
                .padding()
            } else {
                Button("Изменить данные") {
                    isEditing = true
                }
                .padding()
            }
            
            Button("Выйти из аккаунта") {
                UserDefaults.standard.removeObject(forKey: "userName")
                UserDefaults.standard.removeObject(forKey: "userSurname")
                name = ""
                surname = ""
                isEditing = true
            }
            .foregroundColor(.red)
            .padding(.bottom, 50)
            
            Spacer()
        }
        .navigationBarTitle("Аккаунт", displayMode: .inline)
    }
}

#Preview {
    AccountView()
}
