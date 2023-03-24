//
//  ProfileView.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject private var viewModel: ProfileViewModel
    
    /// for image picker
    @State var image = UIImage(systemName: "user")
    
    @State var shouldShowImagePicker = false
    
    var showSignIn: (() -> Void)?
    
    init(_ viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        ZStack {
            ColorManager.backgroundWhite
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Button(action: { }) {
                            Image("back")
                                .renderingMode(Image.TemplateRenderingMode?
                                    .init(Image.TemplateRenderingMode.original))
                        }
                        Spacer()
                        
                        Text("Profile")
                            .foregroundColor(.black)
                            .font(FontManager.bold(size: 17))
                        
                        Spacer()
                        Text("")
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 35)
                    
               //     ImagePersonView(image: viewModel.image, type: .profile)
                    ImagePersonView(data: $viewModel.imgData, type: .profile)
                    
                    Button(action: {
                        shouldShowImagePicker.toggle()
                    }) {
                        Label(title: {
                            Text("Change photo")
                                .foregroundColor(ColorManager.gray)
                                .font(FontManager.regular(size: 9))
                        }, icon: {})
                    }
                    
                    Text(viewModel.namePerson)
                        .foregroundColor(ColorManager.lightBlack2)
                        .font(FontManager.bold(size: 17))
                        .padding(.top, 5)
                    
                    UploadButton()
                }
                .padding(.top, 14)
                
                // MARK: -
                VStack(spacing: 23) {
                    ProfileCell(iconName: "trade", text: "Trade store", imageName: "backRight")

                    ProfileCell(iconName: "trade", text: "Payment method", imageName: "backRight")

                    ProfileCell(iconName: "trade", text: "Balance", imageName: "1530")
                    
                    ProfileCell(iconName: "trade", text: "Trade history", imageName: "backRight")

                    ProfileCell(iconName: "restore", text: "Restore Purchase", imageName: "backRight")
                    
                    ProfileCell(iconName: "ask", text: "Help")

                    ProfileCell(iconName: "logOut", text: "Log out")
                        .contentShape(Rectangle())
                        .onTapGesture {
                            showSignIn?()
                        }
                }
                .padding(.top, 11)
                .padding(.leading, 32)
                .padding(.trailing, 45)
                
                Spacer()
            }
        }
        .sheet(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
                .ignoresSafeArea()
                .onDisappear() {
                    viewModel.saveImage(data: image?.pngData())
                }
        }
    }
}
