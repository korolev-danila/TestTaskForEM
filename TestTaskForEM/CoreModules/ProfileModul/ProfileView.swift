//
//  ProfileView.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var showSignIn: () -> () = { }
    
    private func mock() {
        //print(2.0.squareRoot() * 35)
    }
    
    var body: some View {
        ZStack {
            Color(red: 250/255, green: 249/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            print("button pressed")
                        }) {
                            Image("back")
                                .renderingMode(Image.TemplateRenderingMode?
                                    .init(Image.TemplateRenderingMode.original))
                        }
                        Spacer()
                        
                        Text("Profile")
                            .foregroundColor(.black)
                            .font(Font.custom("Montserrat-Bold", size: 17))
                        
                        Spacer()
                        Text("")
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 35)
                    
                    ZStack {
                        Circle()
                            .fill(Color(red: 192/255, green: 192/255, blue: 192/255))
                            .frame(width: 70, height: 70)
                        
                        Image("user")
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fit)
                            .frame(width: 49.495, height: 49.495)
                    }
                    
                    Button(action: mock) {
                        Label(title: {
                            Text("Change photo")
                                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                                .font(Font.custom("Montserrat-Regular", size: 9))
                        }, icon: {})
                    }
                    
                    Text("Name of user")
                        .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                        .font(Font.custom("Montserrat-Bold", size: 17))
                        .padding(.top, 5)
                    
                    Button(action: mock) {
                        Label(title: {
                            Text("Upload item")
                                .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                                .font(Font.custom("Montserrat-Bold", size: 15))
                                .padding(.trailing, 80)
                        }, icon: {
                            Image("upload")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 16)
                            
                        })
                    }
                    .frame(width: 305, height: 42)
                    .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                    .cornerRadius(15)
                    .padding(.top, 24)
                }
                .padding(.top, 14)
                
                // MARK: -
                VStack(spacing: 23) {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 40, height: 40)
                            Image("trade")
                        }
                        Text("Trade store")
                            .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            .font(Font.custom("Montserrat-Light", size: 15))
                        Spacer()
                        Image("backRight")
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 40, height: 40)
                            Image("trade")
                        }
                        Text("Payment method")
                            .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            .font(Font.custom("Montserrat-Light", size: 15))
                        Spacer()
                        Image("backRight")
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 40, height: 40)
                            Image("trade")
                        }
                        Text("Balance")
                            .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            .font(Font.custom("Montserrat-Light", size: 15))
                        Spacer()
                        Image("1530")
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 40, height: 40)
                            Image("trade")
                        }
                        Text("Trade history")
                            .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            .font(Font.custom("Montserrat-Light", size: 15))
                        Spacer()
                        Image("backRight")
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 40, height: 40)
                            Image("restore")
                        }
                        Text("Restore Purchase")
                            .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            .font(Font.custom("Montserrat-Light", size: 15))
                        Spacer()
                        Image("backRight")
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 40, height: 40)
                            Image("ask")
                        }
                        Text("Help")
                            .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            .font(Font.custom("Montserrat-Light", size: 15))
                        Spacer()
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 40, height: 40)
                            Image("logOut")
                        }
                        Text("Log out")
                            .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            .font(Font.custom("Montserrat-Light", size: 15))
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showSignIn()
                    }
                }
                .padding(.top, 11)
                .padding(.leading, 32)
                .padding(.trailing, 45)
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
