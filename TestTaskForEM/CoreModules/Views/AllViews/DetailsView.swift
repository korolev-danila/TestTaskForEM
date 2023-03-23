//
//  DetailsView.swift
//  TestTaskForEM
//
//  Created by Danila on 22.03.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var indColor = 0
    var model: ModelDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(model.name)
                            .font(Font.custom("Montserrat-Bold", size: 17))
                            .frame( height: 40)
                            .minimumScaleFactor(0.1)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Text(model.description)
                            .foregroundColor(Color(red: 128/255,
                                                   green: 128/255,
                                                   blue: 128/255))
                            .minimumScaleFactor(0.1)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .font(Font.custom("Montserrat-Regulare", size: 17))
                        Spacer()
                    }
                }
                .frame(width: 215)
                
                Spacer()
                Text("$ \(priceFormater(model.price))")
                    .font(Font.custom("Montserrat-Bold", size: 15))
            }
            .frame(height: 110)
            
            // MARK: - numberOfReviews
            HStack(alignment: .center, spacing: 3.5) {
                Image("star")
                    .offset(y: -1)
                Text(String(format: "%.1f", model.rating))
                    .foregroundColor(Color(red: 22/255,
                                           green: 24/255,
                                           blue: 38/255))
                    .font(Font.custom("Montserrat-Regulare", size: 9))
                Text("(\(model.numberOfReviews) reviews)")
                    .foregroundColor(Color(red: 128/255,
                                           green: 128/255,
                                           blue: 128/255))
                    .font(Font.custom("Montserrat-Regulare", size: 9))
            }
            
            // MARK: - ColorView
            Text("Color:")
                .foregroundColor(Color(red: 115/255,
                                       green: 115/255,
                                       blue: 115/255))
                .font(Font.custom("Montserrat-Bold", size: 11))
            
            HStack(spacing: 15) {
                ForEach((0..<model.colors.count), id: \.self) { index in
                    Color(hex: model.colors[index])
                        .frame(width: 32, height:  24)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(index != self.indColor ? .clear :
                                            Color(red: 173/255, green: 173/255, blue: 173/255), lineWidth: 1.5)
                        )
                        .onTapGesture {
                            self.indColor = index
                        }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .frame(height: 184)
    }
}
