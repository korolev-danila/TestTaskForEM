//
//  RegularCell.swift
//  TestTaskForEM
//
//  Created by Danila on 18.03.2023.
//

import SwiftUI

struct RegularCell: View {

    var model: Model

    var body: some View {
        HStack(spacing: 0) {
            /// like a padding(), need for padding 1 object in LazyHGrid
            Text("%")
                .frame(width: 14)
                .foregroundColor(.clear)
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                    .ignoresSafeArea()
                AsyncImg(url: model.imageUrl)
                    .frame(width: 114, height: 149)
                
                if let category = model.category {
                    Text(category)
                        .font(FontManager.bold(size: 7))
                        .foregroundColor(ColorManager.black)
                        .frame(width: 35, height: 12)
                        .background(ColorManager.lightGrayWithAlpha)
                        .clipShape(Capsule())
                        .offset(x: -32, y: 25)
                }
                Text(model.name)
                    .font(FontManager.bold(size: 8))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .offset(x: -19, y: 42)
                    .frame(width: 60, alignment: .leading)
                
                VStack() {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Text( "$ \(priceFormater(model.price))")
                            .font(FontManager.regular(size: 7))
                            .foregroundColor(.white)
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(ColorManager.lightGray)
                                .frame(width: 20, height: 20)
                            Image("plusCell")
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fit)
                                .frame(width: 8, height: 8)
                        }
                    }
                }
                .padding(.leading, 8)
                .padding(.trailing, 4)
                .padding(.bottom, 6)
            }
            .cornerRadius(12)
            .frame(width: 114, height: 149)
        }
    }
}
