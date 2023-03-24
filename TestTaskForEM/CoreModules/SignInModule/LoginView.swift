//
//  LoginView.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel: SignInViewModel
    
    var showMain: (() -> Void)?
    
    @State private var showingAlert = false
    
    init(_ viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    func tapLoginButton() {
        if !viewModel.passwordIsValid { return }
        
        if viewModel.findPersonInArrayAndCheck() {
            showMain?()
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
                TextFieldView(text: $viewModel.userFirstLogin, placeholder: "First name")
                
                SecureFieldView(text: $viewModel.userPassword)
                    .padding(.leading, 8)
            }
            
            LoginButton(action: tapLoginButton, text: "Login")
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
                    hideKeyboard()
                }
            }))
    }
}
