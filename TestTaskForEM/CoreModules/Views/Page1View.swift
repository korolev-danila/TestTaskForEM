//
//  Page1View.swift
//  TestTaskForEM
//
//  Created by Danila on 17.03.2023.
//

import SwiftUI

struct Page1View: View {
    
    @ObservedObject var viewModel: Page1ViewModel
    
    @State var mockStr = ""
    
    var showPage2: () -> () = { }
    
    var body: some View {
        ZStack {
            Color(red: 250/255, green: 249/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack {
                Text("NavBar")
                    .foregroundColor(.clear)
                    .background(Color.clear)
                    .frame(height: 30)
                HStack {
                    Button(action: {
                        print("button pressed")
                    }) {
                        Image("setting")
                    }
                    .padding(.leading, 15)
                    Spacer()
                    
                    Image("logoPage")
                        .padding(.leading, 10)
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color(red: 192/255, green: 192/255, blue: 192/255))
                            .frame(width: 30, height: 30)
                        
                        if let image = self.viewModel.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fill)
                                .frame(width: 27, height: 27)
                                .clipShape(Circle())
                        } else {
                            Image("user")
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                    }
                    .padding(.trailing, 45)
                }
                
                HStack {
                    Spacer()
                    HStack {
                        Text("Location")
                            .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                            .font(Font.custom("Montserrat-Regular", size: 9))
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
                
                HStack {
                    TextField("", text: $mockStr)
                        .placeholder(when: mockStr.isEmpty) {
                            Text("What are you looking for ?")
                                .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                                .font(Font.custom("Montserrat-Light", size: 11))
                        }
                        .frame(width: 263, height: 24)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .background(Color(red: 245/255, green: 246/255, blue: 247/255))
                        .clipShape(Capsule())
                    
                    Image("search")
                        .padding(.leading, -30)
                }
                
                ButtonBarView()
                    .padding(.top, 8)
                
                ScrollView(showsIndicators: false) {
                    // MARK: - Latest colliction
                    VStack(spacing: 4) {
                        HStack {
                            Text("Latest")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(Font.custom("Montserrat-Bold", size: 15))
                            Spacer()
                            Text("View all")
                                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                                .font(Font.custom("Montserrat-Regular", size: 11))
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.fixed(150))], alignment: .center, spacing: 0) {
                                ForEach($viewModel.latestArr, id: \.self) { $item in
                                    RegularCell(model: item)
                                }
                            }
                            .frame(height: 150)
                        }
                    }
                    .padding(.top)
                    
                    //  MARK: - Flash Sale Collection
                    VStack(spacing: 4) {
                        HStack {
                            Text("Flash Sale")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(Font.custom("Montserrat-Bold", size: 15))
                            Spacer()
                            Text("View all")
                                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                                .font(Font.custom("Montserrat-Regular", size: 11))
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.fixed(222))], alignment: .center, spacing: 0) {
                                ForEach($viewModel.flashsArr, id: \.self) { $item in
                                    SaleCell(model: item)
                                        .onTapGesture {
                                            showPage2()
                                        }
                                }
                            }
                            .frame(height: 225)
                        }
                    }
                    .padding(.top)
                    
                    // MARK: - Brands colliction
                    VStack(spacing: 4) {
                        HStack {
                            Text("Brands")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(Font.custom("Montserrat-Bold", size: 15))
                            Spacer()
                            Text("View all")
                                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                                .font(Font.custom("Montserrat-Regular", size: 11))
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.fixed(150))], alignment: .center, spacing: 0) {
                                ForEach($viewModel.latestArr, id: \.self) { $item in
                                    RegularCell(model: item)
                                }
                            }
                            .frame(height: 150)
                        }
                    }
                    .padding(.top)
                    
                    Spacer()
                    Text("")
                        .frame(height: 20)
                }
            }
            .padding(.top, -38)
        }
        .onAppear() {
            viewModel.fetchPerson()
            viewModel.fetchData()
        }
    }
}
