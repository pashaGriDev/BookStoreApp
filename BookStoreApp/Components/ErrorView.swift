//
//  ErrorView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 16.12.23.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    
    var body: some View {
        print(error.localizedDescription)
        return Text("**Error**")
            .font(.system(size: 50))
    }
}

//#Preview {
//    ErrorView()
//}
