//
//  LikeShareView.swift
//  TestTaskForEM
//
//  Created by Danila on 26.03.2023.
//

import SwiftUI

struct LikeShareView: View {
    var body: some View {
        VStack(spacing: 12) {
            Button(action: { print("add to cart") }) {
                Image("like2")
            }
            .frame(width: 38, height: 24)
            
            Image("minus2")
            
            Button(action: { print("add to cart") }) {
                Image("share")
            }
            .frame(width: 38, height: 24)
        }
        .frame(width: 42, height: 95)
        .background(ColorManager.gray6)
        .cornerRadius(15)
    }
}

