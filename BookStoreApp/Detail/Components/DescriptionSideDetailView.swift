//
//  DescriptionSideDetailView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct DescriptionSideDetailView: View {
    private let author: String
    private let rating: Double
    private let addAction: () -> Void
    private let readAction: () -> Void
    
    enum Drawing {
        static let addTitleButton: String = "Add to list"
        static let readTitleButton: String = "Read"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Author: \(author)")
                .padding(.bottom, 5)
            
            Text("Rating: \(rating.formatted())/5")
                .padding(.bottom, 16)
            
            ButtonView(
                title: Drawing.addTitleButton,
                background: .secondary,
                foreground: .black,
                action: {
                    addAction()
                }
            )
            
            ButtonView(
                title: Drawing.readTitleButton,
                background: .primary,
                foreground: .white,
                action: {
                    readAction()
                }
            )
        }
    }
    
    init(
        author: String,
        rating: Double,
        addAction: @escaping () -> Void,
        readAction: @escaping () -> Void
    ) {
        self.author = author
        self.rating = rating
        self.addAction = addAction
        self.readAction = readAction
    }
}

//
//#Preview {
//    DescriptionSideDetailView()
//}
