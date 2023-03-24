//
//  TextFieldView.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField("", text: $text)
            .placeholder(when: text.isEmpty) {
                Text(placeholder).foregroundColor(ColorManager.gray3)
                .font(FontManager.regular(size: 11))
            }
            .frame(width: 289, height: 29)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            .background(ColorManager.lightGray3)
            .clipShape(Capsule())
    }
}
