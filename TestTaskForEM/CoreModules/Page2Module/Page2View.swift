//
//  Page2View.swift
//  TestTaskForEM
//
//  Created by Danila on 21.03.2023.
//

import SwiftUI

struct Page2View: View {
    
    @ObservedObject var viewModel: Page2ViewModel
    @State private var showingSubview = false
    
    var dismissView: (() -> Void)? 
    
    private func animation() {
        withAnimation(.easeOut(duration: 1.2)) {
            showingSubview = true
        }
    }
    
    var body: some View {
        ZStack {
            ColorManager.backgroundWhite
                .ignoresSafeArea()
            
            VStack {
                if let urls = viewModel.model.imageUrls {
                    CarouselView(arrUrl: urls)
                        .padding(.top, 8)
                } else {
                    Text("")
                        .frame(width: 342, height: 400)
                        .padding(.top, 8)
                }
                
                if let model = viewModel.model {
                    DetailsView(model: model)
                        .onAppear {
                            animation()
                        }
                }
                
                Spacer()
            }
            
            // MARK: - AddToCartView
            VStack {
                Spacer()
                
                AddToCartView(minucAction: viewModel.minusItem, plusAction: viewModel.plusItem, price: viewModel.price)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .frame(width: UIScreen.main.bounds.size.width, height: 158)
                    .background(ColorManager.lightBlack)
                    .cornerRadius(28)
                    .offset(y: showingSubview ? 60 : 160)
            }
            
            // MARK: - like/share View
            VStack(spacing: 12) {
                Button(action: { print("add to cart") }) {
                    Image("like2")
                }
                .frame(width: 38, height: 24)
                
                Image("minus2")
                
                Button(action: { print("add to cart") }) {
                    Image("share")
                }
                .frame(width: 38, height: 24)
            }
            .frame(width: 42, height: 95)
            .background(ColorManager.gray6)
            .cornerRadius(15)
            .offset(x: 136, y: -108)
            
            // MARK: - back button
            VStack(alignment: .leading) {
                HStack {
                    Button(action: { dismissView?() }) {
                        Image("backLeft")
                            .frame(width: 42, height: 42)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
