//
//  HeadlineView.swift
//  BookStoreApp
//
//  Created by Alex on 14.12.2023.
//

import SwiftUI

struct HeadlineView: View {
    let headline: String
    let buttonTitle: String
    let action: () -> Void
    
    var body: some View {
        HStack() {
            Text(headline)
                .font(.title3)
            
            Spacer()
            
            Button(buttonTitle, action: action)
                .foregroundStyle(.secondary)
        }
        .padding([.leading, .trailing])
    }
}

#Preview {
    HeadlineView(headline: "Top Books", buttonTitle: "see more", action: {})
}
