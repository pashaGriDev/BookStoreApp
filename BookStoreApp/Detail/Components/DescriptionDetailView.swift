//
//  DescriptionDetailView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct DescriptionDetailView: View {
    private let description: String
    private let padding: CGFloat = 10.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description:")
                .font(.headline)
                .padding(.bottom, padding)
                .padding(.horizontal, padding)
            
            Text(description)
                .font(.system(.subheadline, design: .serif))
                .padding(.horizontal, padding)
        }
        .padding(.top, padding)
    }
    
    init(
        _ description: String
    ) {
        self.description = description
    }
}
//
//#Preview {
//    DescriptionDetailView()
//}
