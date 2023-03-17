//
//  LoginView.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel: SignInViewModel
    
    var showMain: () -> () = { }
    
    @State private var isSecure = true
    @State private var showingAlert = false
    
    init(_ viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    func tapLoginButton() {
        if !viewModel.passwordIsValid { return }
        
        if viewModel.findPersonInArrayAndCheck() {
            showMain()
        } else {
            showingAlert = true
        }        
    }
    
    var body: some View {
        VStack() {
            Image("Welcome")
                .resizable()
                .scaledToFit()
                .frame(width: 195.63, height: 20, alignment: .center)
                .padding(77.77)
            
            VStack(alignment: .center, spacing: 35) {
                TextField("", text: $viewModel.userFirstLogin)
                    .placeholder(when: viewModel.userFirstLogin.isEmpty) {
                        Text("First name").foregroundColor(Color(red: 123/255,
                                                                 green: 123/255,
                                                                 blue: 123/255))
                        .font(Font.custom("Montserrat-Regular", size: 11))
                    }
                    .frame(width: 289, height: 29)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .clipShape(Capsule())
                
                HStack {
                    Group {
                        if isSecure {
                            SecureField("", text: $viewModel.userPassword)
                        } else {
                            TextField("", text: $viewModel.userPassword)
                        }
                    }
                    .animation(.easeInOut(duration: 0.2), value: isSecure)
                    .placeholder(when: viewModel.userPassword.isEmpty) {
                        Text("Password").foregroundColor(Color(red: 123/255,
                                                               green: 123/255,
                                                               blue: 123/255))
                        .font(Font.custom("Montserrat-Regular", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0))
                    }
                    .frame(width: 261, height: 29)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 36))
                    .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .clipShape(Capsule())
                    
                    Button(action: {
                        isSecure.toggle()
                    }, label: {
                        Image(systemName: isSecure ? "eye.slash" : "eye" )
                            .foregroundColor(Color(red: 123/255, green: 123/255,
                                                   blue: 123/255))
                    })
                    .padding(.leading, -44)
                }
                .padding(.leading, 8)
            }
            
            Button(action: tapLoginButton) {
                Label(title: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(Font.custom("Montserrat-Bold", size: 15))
                        .frame(width: 305, height: 46)
                        .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                        .cornerRadius(15)
                        .contentShape(Rectangle())
                }, icon: {})
            }
            .padding(.top, 66)
            
            Spacer()
        }
        .padding(.top, 66)
        .alert(isPresented:$showingAlert) {
            Alert(title: Text("Not found"), message: Text("Email or password is not correct."), dismissButton: .cancel())
        }
        .gesture(DragGesture(minimumDistance: 8, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height > 0 &&
                                    value.translation.width < 100 &&
                                    value.translation.width > -100 {
                                    print("8888")
                                    hideKeyboard()
                                    }
                            }))
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
