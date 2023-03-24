//
//  ButtonBarView.swift
//  TestTaskForEM
//
//  Created by Danila on 18.03.2023.
//

import SwiftUI

enum ButtonBarEnum: String, CaseIterable {
    case phone = "phone"
    case headPhone = "headPhone"
    case game = "game"
    case car = "car"
    case sleep = "sleep"
    case robot = "robot"
}

struct BarButton: View {
    
    var buttonBar: ButtonBarEnum
    var text: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(ColorManager.lightGray)
                    .frame(width: 40, height: 40)
                Image(buttonBar.rawValue)
            }
            Text(text)
                .foregroundColor(ColorManager.gray2)
                .font(FontManager.regular(size: 9))
                .padding(.top, 4)
        }
    }
}

struct ButtonBarView: View {
    private func setTitle(e: ButtonBarEnum) -> String {
        switch e {
        case .phone:
            return "Phones"
        case .headPhone:
            return "HeadPhone"
        case .game:
            return "Games"
        case .car:
            return "Cars"
        case .sleep:
            return "Furniture"
        case .robot:
            return "kids"
        }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 19) {
                Text("")
                
                ForEach( ButtonBarEnum.allCases , id: \.self) { item in
                    BarButton(buttonBar: item, text: setTitle(e: item))
                }
                
                ForEach( ButtonBarEnum.allCases , id: \.self) { item in
                    BarButton(buttonBar: item, text: setTitle(e: item))
                }
                
                Text("")
            }
        }
    }
}
