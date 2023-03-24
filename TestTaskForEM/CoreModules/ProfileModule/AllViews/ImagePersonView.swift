//
//  ImagePersonView.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct ImagePersonView: View {
    
    @Binding var data: Data?
    var type: TypeImgPersView
    
    enum TypeImgPersView {
        case profile
        case page1
        
        func getSize() -> CGFloat {
            switch self {
            case .profile:
                return 70
            case .page1:
                return 27
            }
        }
        
        func getColor() -> Color {
            switch self {
            case .profile:
                return ColorManager.gray5
            case .page1:
                return ColorManager.darkGray
            }
        }
    }
    
    private func unwrapImg() -> Image {
        if let data {
            if let image = UIImage(data: data) {
                return Image(uiImage: image)
            }
        }
        return Image("user")
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(type.getColor())
                .frame(width: type.getSize(), height: type.getSize())
            
            unwrapImg()
                .resizable()
                .aspectRatio(1.0, contentMode: .fill)
                .frame(width: type.getSize() * 0.94, height: type.getSize() * 0.94)
                .clipShape(Circle())
        }
    }
}

