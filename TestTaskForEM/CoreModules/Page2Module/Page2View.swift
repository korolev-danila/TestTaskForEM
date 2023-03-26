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
            
            LikeShareView()
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
