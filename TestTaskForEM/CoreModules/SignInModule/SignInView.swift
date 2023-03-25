//
//  SignInView.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject private var viewModel: SignInViewModel
    
    @State private var isEmailValid = true
    @State private var showingAlert = false
    
    var showMain: (() -> Void)?
    var showLogin: (() -> Void)?
    
    init(_ viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    private func tapSignInButton() {
        isEmailValid = viewModel.emailIsValid
        
        if !viewModel.formIsValid { return }
        
        if viewModel.findOldPersonForEmail() {
            showingAlert = true
        } else if viewModel.saveNewPerson() {
            showMain?()
        }
        hideKeyboard()
    }
    
    var body: some View {
        VStack {
            Image("SignIn")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 28, alignment: .center)
                .padding(66)
            
            VStack(alignment: .center, spacing: 35) {
                TextFieldView(text: $viewModel.userFirstName, placeholder: "First name")
                
                TextFieldView(text: $viewModel.userLastName, placeholder: "Last name")
                
                VStack {
                    TextFieldView(text: $viewModel.userEmail, placeholder: "Email")
                    
                    Text("use the correct email")
                        .font(FontManager.regular(size: 9))
                        .foregroundColor(.red)
                        .show(isVisible: !isEmailValid)
                }
                
                LoginButton(action: tapSignInButton, text: "Sign in")
                    .padding(.top, -16)
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(ColorManager.gray)
                        .font(FontManager.regular(size: 10))
                    
                    Button(action: { showLogin?() }) {
                        Label(title: {
                            Text("Log in")
                                .foregroundColor(ColorManager.blue2)
                                .font(FontManager.regular(size: 10))
                        }, icon: {})
                    }
                    Spacer()
                }
                .frame(width: 305, height: 14)
                .padding(.top, -17.5)
                
                GoogleAppleView()
            }
            
            Spacer()
        }
        .padding(.top)
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("This email is already in use"),
                message: Text("Do you want to switch to login?"),
                primaryButton: .destructive(Text("Go")) {
                    showLogin?()
                },
                secondaryButton: .cancel()
            )
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
