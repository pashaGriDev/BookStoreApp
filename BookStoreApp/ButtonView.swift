//
//  ButtonView.swift
//  BookStoreApp
//
//  Created by Alex on 05.12.2023.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let background: Color
    let foreground: Color
    let action: () -> Void
    
    
    var body: some View {
        Button(title, action: action)
            .font(.subheadline)
            .frame(width: 161, height: 40)
            .background(background)
            .foregroundStyle(foreground)
            .clipShape(.rect(cornerRadius: 4))
    }
}

#Preview {
    ButtonView(title: "Add to list", background: .secondary, foreground: .black, action: {})
}
