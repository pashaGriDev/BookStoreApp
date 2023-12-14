//
//  SwitchButtonView.swift
//  BookStoreApp
//
//  Created by Alex on 14.12.2023.
//

import SwiftUI

struct SwitchButtonView: View {
    @State private var isSelected = false
    let title: String
    
    var body: some View {
        Button {
            isSelected.toggle()
            // другой экшн
            // не забыть добавить логику отключения кнопки при включении другой
        } label: {
            Text(title)
                .font(.footnote)
                .frame(maxWidth: 68, maxHeight: 10)
                .padding()
                .background(isSelected ? .black : .white)
                .foregroundColor(isSelected ? .white : .black)
                .clipShape(.rect(cornerRadius: 6))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.black, lineWidth: 1)
                )
        }
    }
}

#Preview {
    SwitchButtonView(title: "This Week")
}
