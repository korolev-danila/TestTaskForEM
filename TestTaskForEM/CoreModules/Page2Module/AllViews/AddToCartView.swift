//
//  AddToCartView.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct AddToCartView: View {
    
    var minucAction: (() -> Void)
    var plusAction: (() -> Void)
    var price: Double

    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 11.50) {
                    Text("Quantity:")
                        .foregroundColor(ColorManager.gray)
                        .font(FontManager.regular(size: 11))
                    
                    HStack {
                        Button(action: { minucAction() }) {
                            Image("minus")
                                .foregroundColor(.white)
                                .frame(width: 38, height: 22)
                                .background(ColorManager.blue)
                                .cornerRadius(8)
                        }
                        Button(action: { plusAction() }) {
                            Image("plus")
                                .foregroundColor(.white)
                                .frame(width: 38, height: 22)
                                .background(ColorManager.blue)
                                .cornerRadius(8)
                        }
                    }
                }
                Spacer()
                
                Button(action: {
                    print("add to cart")
                }) {
                    HStack {
                        Text("$ \(priceFormater(price))")
                            .foregroundColor(ColorManager.violet)
                            .font(FontManager.bold(size: 11))
                        
                        Text("Add to cart")
                            .foregroundColor(.white)
                            .font(FontManager.bold(size: 11))
                    }
                    .frame(width: 170, height: 44)
                    .background(ColorManager.blue)
                    .cornerRadius(15)
                    .contentShape(Rectangle())
                }
            }
            .padding(.top, 24)
            .padding(.horizontal, 24)
            
            Spacer()
        }
    }
}
