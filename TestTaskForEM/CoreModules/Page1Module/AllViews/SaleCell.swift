//
//  SaleCell.swift
//  TestTaskForEM
//
//  Created by Danila on 17.03.2023.
//

import SwiftUI

struct SaleCell: View {
    
    var model: Model
    
    var body: some View {
        HStack(spacing: 0) {
            /// like a padding(), need for padding 1 object in LazyHGrid
            Text("")
                .frame(width: 14)
                .foregroundColor(.clear)
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                    .ignoresSafeArea()
                AsyncImg(url: model.imageUrl)
                    .frame(width: 174, height: 221)

                if let category = model.category {
                    Text(category)
                        .font(FontManager.bold(size: 10))
                        .foregroundColor(.black)
                        .frame(width: 49, height: 17)
                        .background(ColorManager.lightGrayWithAlpha)
                        .clipShape(Capsule())
                        .offset(x: -52, y: 18)
                }
                
                VStack(alignment: .leading) {
                    Text(model.name)
                        .font(FontManager.bold(size: 12))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .frame(width: 90, alignment: .leading)
                        .padding(.top, -4)
                }
                .offset(x: -32, y: 48)
                
                VStack {
                    if let discount = model.discount {
                        HStack(alignment: .top) {
                            Image("imgBrand")
                            Spacer()
                            
                            Text(" \(Int(discount))% off ")
                                .font(FontManager.bold(size: 9))
                                .foregroundColor(.white)
                                .frame(width: 49,height: 18)
                                .background(ColorManager.red)
                                .clipShape(Capsule())
                        }
                        .padding(.top, 10)
                    }
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Spacer()
                            HStack {
                                Text( "$ \(priceFormater(model.price))")
                                    .font(FontManager.bold(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                                ZStack {
                                    Circle()
                                        .fill(ColorManager.lightGray)
                                        .frame(width: 28, height: 28)
                                    Image("likeCell")
                                }
                                .padding(.trailing, -2)
                                ZStack {
                                    Circle()
                                        .fill(ColorManager.lightGray)
                                        .frame(width: 35, height: 35)
                                    Image("plusCell")
                                        .resizable()
                                        .aspectRatio(1.0, contentMode: .fit)
                                        .frame(width: 13, height: 13)
                                }
                            }
                        }
                        .frame(height: 90)
                    }
                }
                .padding(.leading, 12)
                .padding(.trailing, 6)
                .padding(.bottom, 8)
            }
            .cornerRadius(15)
            .frame(width: 174, height: 221)
        }
    }
}

