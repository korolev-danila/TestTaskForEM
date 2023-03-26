//
//  SearchView.swift
//  TestTaskForEM
//
//  Created by Danila on 23.03.2023.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var text: String
    @Binding var array: [String]
    
    private var heightOfCells: CGFloat { CGFloat(array.count * 24) }
    
    @State private var showingSubview = false
    
    private func animation() {
        withAnimation(.easeOut(duration: 0.6)) {
            showingSubview = (array.count == 0 ? false : true)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty) {
                        Text("What are you looking for ?")
                            .foregroundColor(ColorManager.darkGray2)
                            .font(FontManager.light(size: 11))
                    }
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .background(ColorManager.backgroundSearch)
                    .clipShape(Capsule())
                    .submitLabel(.search)

                Image("search")
                    .padding(.leading, -20)
            }
            .frame(height: 24)
            
            VStack(spacing: 0) {
                ForEach(array, id: \.self) { data in
                    HStack {
                        Text(data)
                            .font(FontManager.light(size: 11))
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .containerShape(Rectangle())
                    .onTapGesture {
                        text = data
                        array = []
                    }
                }
                .frame(height: showingSubview ? 24 : 0)
                .onChange(of: array) { _ in
                    animation()
                }
            }
            .padding(.top, 8)
            Spacer()
        }
        .frame(height: (showingSubview ? heightOfCells : 0) + 34)
    }
}

