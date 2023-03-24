//
//  SearchView.swift
//  TestTaskForEM
//
//  Created by Danila on 23.03.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var text = ""
    @State var array = ["1", "2", "3^^^^^^^^^^^^", "4", "5"]
    let width: CGFloat = 240
    let height: CGFloat = 200
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty) {
                        Text("What are you looking for ?")
                            .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                            .font(Font.custom("Montserrat-Light", size: 11))
                    }
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .background(Color(red: 245/255, green: 246/255, blue: 247/255))
                    .clipShape(Capsule())
                
                Image("search")
                    .padding(.leading, -20)
            }
            .frame(height: 24)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 200))], alignment: .leading, spacing: 4) {
                ForEach($array, id: \.self) { $item in
                    ZStack {
                        Color(red: 245/255, green: 246/255, blue: 247/255)
                            .ignoresSafeArea()
                        HStack {
                            Text(item)
                                .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                                .font(Font.custom("Montserrat-Light", size: 15))
                                .padding(.leading, 18)
                            Spacer()
                        }
                        
                    }
                    .frame(width: width, height: 24)
                    .clipShape(Capsule())
                    .offset(y: -24 )
                    
                }
            }
            .frame(height: 150)
            Spacer()
        }
        .frame(width: width, height: height)
        .background(Color.yellow)
    }
}
