//
//  Page1View.swift
//  TestTaskForEM
//
//  Created by Danila on 17.03.2023.
//

import SwiftUI

struct Page1View: View {
    
    @ObservedObject var viewModel: Page1ViewModel
    
    var showPage2: ((Model) -> Void)?
    
    var body: some View {
        ZStack {
            ColorManager.backgroundWhite
                .ignoresSafeArea()
            
            VStack {
                Text("NavBar")
                    .foregroundColor(.clear)
                    .background(Color.clear)
                    .frame(height: 34)
                
                HStack {
                    Button(action: { }) {
                        Image("setting")
                    }
                    .padding(.leading, 15)
                    Spacer()
                    Image("logoPage")
                        .padding(.leading, 10)
                    Spacer()
                    
                    ImagePersonView(data: $viewModel.imgData, type: .page1)
                        .padding(.trailing, 45)
                }
                
                HStack {
                    Spacer()
                    HStack {
                        Text("Location")
                            .foregroundColor(ColorManager.darkGray2)
                            .font(FontManager.regular(size: 9))
                        Image("backBottom")
                            .foregroundColor(.black)
                            .padding(.leading, -4)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("location")
                    }
                    .padding(.trailing, 34)
                }
                .padding(.top,2)
                
                SearchView(text: $viewModel.searchText, array: $viewModel.products)
                    .frame(width: 260)
                
                ButtonBarView()
                
                // MARK: - colliction
                ScrollView(showsIndicators: false) {
                    CollectionView(type: .latest, array: $viewModel.latestArr)
                        .padding(.top)
                    
                    CollectionView(type: .flash, array: $viewModel.flashsArr, showPage2: showPage2)
                        .padding(.top)
                    
                    CollectionView(type: .brands, array: $viewModel.latestArr)
                        .padding(.top)
                    
                    Spacer()
                    Text("")
                        .frame(height: 20)
                }
            }
            .padding(.top, -38)
        }
        .onAppear() {
            viewModel.updateProp()
            viewModel.fetchData()
        }
    }
}
