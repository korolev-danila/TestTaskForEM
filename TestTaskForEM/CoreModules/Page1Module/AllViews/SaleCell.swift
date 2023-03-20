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
            /// like a padding()
            Text("%")
                .frame(width: 14)
                .foregroundColor(.clear)
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                    .ignoresSafeArea()
                if let data = model.image {
                    Image(data: data)?
                        .resizable()
                        .scaledToFill()
                }
                Text(model.category)
                    .font(Font.custom("Montserrat-Bold", size: 10))
                    .foregroundColor(.black)
                    .frame(width: 49, height: 17)
                    .background(Color(CGColor(red: 196/255, green: 196/255,
                                              blue: 196/255, alpha: 0.75)))
                    .clipShape(Capsule())
                    .offset(x: -52, y: 18)
                
                VStack(alignment: .leading) {
                    Text(model.name)
                        .font(Font.custom("Montserrat-Bold", size: 12, relativeTo: .headline))
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
                                .font(Font.custom("Montserrat-Bold", size: 9))
                                .foregroundColor(.white)
                                .frame(width: 49,height: 18)
                                .background(Color(red: 249/255, green: 55/255, blue: 55/255))
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
                                    .font(Font.custom("Montserrat-Bold", size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                        .frame(width: 28, height: 28)
                                    Image("likeCell")
                                }
                                .padding(.trailing, -2)
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
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

//struct SellCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        let model = Model(category: "Kids", name: "New Balance Sneakers", // Balance Sneakers
//                          price: 22, discount: 30, image: Image("fon"))
//        
//        SaleCellView(model: model)
//    }
//}
