//
//  CarouselView.swift
//  TestTaskForEM
//
//  Created by Danila on 21.03.2023.
//

import SwiftUI

struct CarouselView: View {
    @State private var index = 0
    @State var arrUrl: [String]
    
    var body: some View {
        VStack(spacing: 40) {
            TabView(selection: $index) {
                ForEach((0..<arrUrl.count), id: \.self) { index in
                    HStack {
                        AsyncImg(url: arrUrl[index])
                            .frame(width: 342, height: 294)
                            .clipped()
                            .cornerRadius(15)
                        
                        Spacer()
                    }
                    .offset(x: -10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 5) {
                ForEach((0..<arrUrl.count), id: \.self) { index in
                    AsyncImg(url: arrUrl[index])
                        .frame(width: index == self.index ? 83 : 65,
                               height: index == self.index ? 45 : 37)
                        .cornerRadius(6)
                        .shadow(color: index != self.index ? .clear :
                                    Color(CGColor(gray: 0.5, alpha: 0.7)), radius: 3, x: 0, y: 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke( ColorManager.lightGray2, lineWidth: 1.5)
//                                .stroke(index == self.index ? .clear :
//                                            ColorManager.lightGray2, lineWidth: 1.5)
                        )
                        .offset(y: index == self.index ? 0 : 4)
                        .onTapGesture {
                            self.index = index
                        }
                }
            }
        }
        .frame(height: 400)
    }
}
