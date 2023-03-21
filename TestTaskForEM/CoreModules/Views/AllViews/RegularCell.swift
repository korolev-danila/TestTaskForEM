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
            /// like a padding()
            Text("%")
                .frame(width: 14)
                .foregroundColor(.clear)
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                    .ignoresSafeArea()
                if let data = model.imageData {
                    Image(data: data)?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 114, height: 149)
                }
                Text(model.category)
                    .font(Font.custom("Montserrat-Bold", size: 7))
                    .foregroundColor(.black)
                    .frame(width: 35, height: 12)
                    .background(Color(CGColor(red: 196/255, green: 196/255,
                                              blue: 196/255, alpha: 0.75)))
                    .clipShape(Capsule())
                    .offset(x: -32, y: 25)
                
                Text(model.name)
                    .font(Font.custom("Montserrat-Bold", size: 8))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .offset(x: -19, y: 42)
                    .frame(width: 60, alignment: .leading)
                
                VStack() {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Text( "$ \(priceFormater(model.price))")
                            .font(Font.custom("Montserrat-Regular", size: 7))
                            .foregroundColor(.white)
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
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

//struct RegularCell_Previews: PreviewProvider {
//    static var previews: some View {
//        let model = Model(category: "Kids", name: "Sony ", // Playstation 5
//                          price: 180000, image: Image("fon"))
//        RegularCell(model: model)
//    }
//}
