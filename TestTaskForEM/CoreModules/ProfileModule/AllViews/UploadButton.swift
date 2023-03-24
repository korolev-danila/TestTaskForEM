//
//  UploadButton.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct UploadButton: View {
    var body: some View {
        Button(action: { }) {
            Label(title: {
                Text("Upload item")
                    .foregroundColor(ColorManager.lightGray4)
                    .font(FontManager.bold(size: 15))
                    .padding(.trailing, 80)
            }, icon: {
                Image("upload")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 16)
            })
            .frame(width: 305, height: 42)
            .background(ColorManager.blue)
            .cornerRadius(15)
            .padding(.top, 24)
            .contentShape(Rectangle())
        }
    }
}
