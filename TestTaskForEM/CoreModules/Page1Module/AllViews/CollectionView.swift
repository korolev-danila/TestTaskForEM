//
//  CollectionView.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct CollectionView: View {
    
    var type: TypeCollection
    @Binding var array: [Model]
    var showPage2: ((Model) -> Void)?
    
    @State private var showingSubview = false
    
    enum TypeCollection {
        case latest
        case flash
        case brands
    }
    
    private func animation() {
        withAnimation(.easeOut(duration: 1.2)) {
            showingSubview = true
        }
    }
    
    private func getTitle() -> String {
        switch type {
        case .latest:
            return "Latest"
        case .flash:
            return "Flash Sale"
        case .brands:
            return "Brands"
        }
    }
    
    private func getHeight() -> CGFloat {
        switch type {
        case .latest:
            return 150
        case .flash:
            return 222
        case .brands:
            return 150
        }
    }
    
    private func getCellFor(_ item: Model) -> any View {
        switch type {
        case .latest:
            return RegularCell(model: item)
        case .flash:
            return SaleCell(model: item)
        case .brands:
            return RegularCell(model: item)
        }
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(getTitle())
                    .foregroundColor(ColorManager.black)
                    .font(FontManager.bold(size: 15))
                Spacer()
                Text("View all")
                    .foregroundColor(ColorManager.gray)
                    .font(FontManager.regular(size: 11))
            }
            .padding(.leading)
            .padding(.trailing)
            
            ScrollView(.horizontal, showsIndicators: false) {
                if array.count > 0 {
                    LazyHGrid(rows: [GridItem(.fixed(getHeight()))], alignment: .center, spacing: 0) {
                        
                        ForEach($array, id: \.self) { $item in
                            if type == .flash {
                                SaleCell(model: item)
                                    .onTapGesture {
                                        if let showPage2 {
                                            showPage2(item)
                                        }
                                    }
                            } else {
                                RegularCell(model: item)
                            }
                        }
                    }
                    .onAppear {
                        animation()
                    }
                }
            }
            .frame(height: getHeight())
            .offset(x: showingSubview ? 0 : UIScreen.main.bounds.size.width)
        }
    }
}

