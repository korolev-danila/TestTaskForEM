//
//  Page2View.swift
//  TestTaskForEM
//
//  Created by Danila on 21.03.2023.
//

import SwiftUI

struct Page2View: View {
    
    @ObservedObject var viewModel: Page2ViewModel
            
    var dismissView: () -> () = { }
    
    var body: some View {
        ZStack {
            Color(red: 250/255, green: 249/255, blue: 255/255)
                .ignoresSafeArea()
            VStack {
                if let data = viewModel.model?.imageData {
                    CarouselView(array: data)
                        .padding(.top, 8)
                } else {
                    EmptyView()
                        .frame(width: 342, height: 400)
                        .padding(.top, 8)
                }
                
                if let model = viewModel.model {
                    DetailsView(model: model)
                } else {
                    EmptyView()
                        .frame(height: 184)
                }
                
                Spacer()
            }
            
            // MARK: - AddtoCartView
            VStack {
                Spacer()
                
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 11.50) {
                            Text("Quantity:")
                                .foregroundColor(Color(red: 128/255,
                                                       green: 128/255,
                                                       blue: 128/255))
                                .font(Font.custom("Montserrat-Regulare", size: 11))
                            
                            HStack {
                                Button(action: { print("-") }) {
                                    Image("minus")
                                        .foregroundColor(.white)
                                        .frame(width: 38, height: 22)
                                        .background(Color(red: 78/255,
                                                          green: 85/255,
                                                          blue: 215/255))
                                        .cornerRadius(8)
                                }
                                
                                Button(action: { print("+") }) {
                                    Image("plus")
                                        .foregroundColor(.white)
                                        .frame(width: 38, height: 22)
                                        .background(Color(red: 78/255,
                                                          green: 85/255,
                                                          blue: 215/255))
                                        .cornerRadius(8)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            print("add to cart")
                        }) {
                            HStack {
                                Text("#2,500")
                                    .foregroundColor(Color(red: 153/255,
                                                           green: 160/255,
                                                           blue: 255/255))
                                    .font(Font.custom("Montserrat-Bold", size: 11))
                                
                                Text("Add to cart")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Montserrat-Bold", size: 11))
                            }
                            .frame(width: 170, height: 44)
                            .background(Color(red: 78/255,
                                              green: 85/255,
                                              blue: 215/255))
                            .cornerRadius(15)
                            .contentShape(Rectangle())
                        }
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 24)
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .frame(width: UIScreen.main.bounds.size.width, height: 158)
                .background(Color(red: 24/255, green: 23/255, blue: 38/255))
                .cornerRadius(28)
                .offset(y: 60)
            }
            
            // MARK: - like/share view
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
            .background(Color(red: 229/255, green: 233/255, blue: 239/255))
            .cornerRadius(15)
            .offset(x: 136, y: -108)
            
            // MARK: - back button
            VStack(alignment: .leading) {
                HStack {
                    Button(action: { dismissView() }) {
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
