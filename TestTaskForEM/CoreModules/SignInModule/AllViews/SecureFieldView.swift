//
//  SecureFieldView.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct SecureFieldView: View {
    
    @Binding var text: String
    @State private var isSecure = true
    
    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: isSecure)
            .placeholder(when: text.isEmpty) {
                Text("Password").foregroundColor(ColorManager.gray3)
                    .font(FontManager.regular(size: 11))
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0))
            }
            .frame(width: 261, height: 29)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 36))
            .background(ColorManager.lightGray3)
            .clipShape(Capsule())
            
            Button(action: {
                isSecure.toggle()
            }, label: {
                Image(systemName: isSecure ? "eye.slash" : "eye" )
                    .foregroundColor(ColorManager.gray3)
            })
            .padding(.leading, -44)
        }
    }
}
