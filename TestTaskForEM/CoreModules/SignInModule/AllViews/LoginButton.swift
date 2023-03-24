//
//  LoginButton.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct LoginButton: View {
    
    var action: () -> Void
    var text: String
    
    var body: some View {
        Button(action: action) {
            Label(title: {
                Text(text)
                    .foregroundColor(.white)
                    .font(FontManager.bold(size: 15))
                    .frame(width: 305, height: 46)
                    .background(ColorManager.blue)
                    .cornerRadius(15)
                    .contentShape(Rectangle())
            }, icon: {})
        }
    }
}
