//
//  ProfileCell.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct ProfileCell: View {
    
    var iconName: String
    var text: String
    var imageName: String?
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(ColorManager.lightGray)
                    .frame(width: 40, height: 40)
                Image(iconName)
            }
            Text(text)
                .foregroundColor(ColorManager.black)
                .font(FontManager.light(size: 15))
            Spacer()
            if let imageName {
                Image(imageName)
            }
        }
    }
}

