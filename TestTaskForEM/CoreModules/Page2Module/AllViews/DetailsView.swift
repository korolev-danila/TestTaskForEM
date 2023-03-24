//
//  DetailsView.swift
//  TestTaskForEM
//
//  Created by Danila on 22.03.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var indColor = 0
    var model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(model.name)
                            .font(FontManager.bold(size: 17))
                            .frame( height: 40)
                            .minimumScaleFactor(0.1)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Text(model.description ?? "")
                            .foregroundColor(ColorManager.gray)
                            .frame(height: 50)
                            .minimumScaleFactor(0.1)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .font(FontManager.regular(size: 17))
                        Spacer()
                    }
                }
                .frame(width: 215)
                
                Spacer()
                Text("$ \(priceFormater(model.price))")
                    .font(FontManager.bold(size: 15))
            }
            
            // MARK: - numberOfReviews
            HStack(alignment: .center, spacing: 3.5) {
                Image("star")
                    .offset(y: -1)
                Text(String(format: "%.1f", model.rating ?? "0.0"))
                    .foregroundColor(ColorManager.lightBlack)
                    .font(FontManager.regular(size: 9))
                if let reviews = model.numberOfReviews {
                    Text("(\(reviews) reviews)")
                        .foregroundColor(ColorManager.gray)
                        .font(FontManager.regular(size: 9))
                } else {
                    Text("(0 reviews)")
                        .foregroundColor(ColorManager.gray)
                        .font(FontManager.regular(size: 9))
                }
            }
            
            // MARK: - ColorView
            Text("Color:")
                .foregroundColor(ColorManager.gray1)
                .font(FontManager.bold(size: 11))
            
            HStack(spacing: 15) {
                if let colors = model.colors {
                    ForEach((0..<colors.count), id: \.self) { index in
                        Color(hex: colors[index])
                            .frame(width: 32, height:  24)
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .strokeBorder(index != self.indColor ? .clear :
                                                    ColorManager.gray4 , lineWidth: 1.5)
                            )
                            .onTapGesture {
                                self.indColor = index
                            }
                    }
                }
            }
            .frame(height:  24)
            Spacer()
        }
        .padding(.horizontal, 24)
        .frame(height: 184)
    }
}
