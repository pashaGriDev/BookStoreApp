//
//  BookCellView.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 14.12.23.
//

import SwiftUI

struct BookCellView: View {
    let item: WorksModel
    
    var body: some View {
        VStack {
            ZStack{
                Image("category_4")
                    .resizable()
                    .padding(.horizontal, 44)
                    .padding(.vertical, 11)
                VStack{
                    Spacer()
                    HStack(){
                        VStack (alignment: .leading, spacing: 8){
                            Text(item.title)
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                            Text("Text111111111")
                                .lineLimit(2)
                                .font(.system(size: 21).bold())
                                .foregroundStyle(.white)
                            Text("Text")
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                        }
                        .frame(width: 180)
                        .padding(.vertical, 12)
                        .background(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(width: 180)
        .background(.gray)
        .cornerRadius(8)
    }
}

//#Preview {
//    BookCellView()
//}
