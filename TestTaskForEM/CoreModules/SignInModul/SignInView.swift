//
//  SignInView.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject private var viewModel: SignInViewModel
    
    var showMain: () -> () = { }
    var showLogin: () -> () = { }
    
    @State private var isEmailValid = true
    @State private var showingAlert = false
    
    init(_ viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
        
    private func tapSignInButton() {
        isEmailValid = viewModel.emailIsValid
        
        if viewModel.formIsValid {
            if viewModel.findOldPersonForEmail() {
                showingAlert = true
            } else if viewModel.saveNewPerson() {
                showMain()
            }
            hideKeyboard()
        }
    }
    
    var body: some View {
        VStack {
            Image("SignIn")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 28, alignment: .center)
                .padding(66)
            
            VStack(alignment: .center, spacing: 35) {
                TextField("", text: $viewModel.userFirstName)
                    .placeholder(when: viewModel.userFirstName.isEmpty) {
                        Text("First name").foregroundColor(Color(red: 123/255,
                                                                 green: 123/255,
                                                                 blue: 123/255))
                        .font(Font.custom("Montserrat-Regular", size: 11))
                    }
                    .frame(width: 289, height: 29)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .clipShape(Capsule())
                
                TextField("", text: $viewModel.userLastName)
                    .placeholder(when: viewModel.userLastName.isEmpty) {
                        Text("Last name").foregroundColor(Color(red: 123/255,
                                                                green: 123/255,
                                                                blue: 123/255))
                        .font(Font.custom("Montserrat-Regular", size: 11))
                    }
                    .frame(width: 289, height: 29)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .clipShape(Capsule())
                
                VStack {
                    TextField("", text: $viewModel.userEmail)
                        .placeholder(when: viewModel.userEmail.isEmpty) {
                            Text("Email").foregroundColor(Color(red: 123/255,
                                                                green: 123/255,
                                                                blue: 123/255))
                            .font(Font.custom("Montserrat-Regular", size: 11))
                        }
                        .frame(width: 289, height: 29)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                        .clipShape(Capsule())
                    
                    
                    Text("use the correct email")
                        .font(Font.custom("Montserrat-Regular", size: 9))
                        .foregroundColor(.red)
                        .show(isVisible: !isEmailValid)
                }
                
                Button(action: tapSignInButton) {
                    Label(title: {
                        Text("Sign in")
                            .foregroundColor(.white)
                            .font(Font.custom("Montserrat-Bold", size: 15))
                    }, icon: {})
                }
                .frame(width: 305, height: 46)
                .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                .cornerRadius(15)
                .padding(.top, -16)
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .font(Font.custom("Montserrat-Regular", size: 10))
                    
                    Button(action: showLogin) {
                        Label(title: {
                            Text("Log in")
                                .foregroundColor(Color(red: 37/255, green: 79/255, blue: 230/255))
                                .font(Font.custom("Montserrat-Regular", size: 10))
                        }, icon: {})
                    }
                    Spacer()
                }
                .frame(width: 305, height: 14)
                .padding(.top, -17.5)
                
                
                VStack(spacing: 38) {
                    Button(action: tapSignInButton) {
                        Label(title: {
                            Text("Sign in with Google")
                                .foregroundColor(.black)
                                .font(Font.custom("Montserrat-Regular", size: 13))
                        }, icon: {
                            Image("Google")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 24, height: 24)
                        })
                    }
                    
                    Button(action: tapSignInButton) {
                        Label(title: {
                            Text("Sign in with Apple")
                                .foregroundColor(.black)
                                .font(Font.custom("Montserrat-Regular", size: 13))
                        }, icon: {
                            Image("Apple")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 24, height: 24)
                        })
                    }
                    .padding(.leading, -12)
                }
                .padding(.top, 45)
            }
            
            Spacer()
        }
        .padding(.top)
        .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("This email is already in use"),
                        message: Text("Do you want to switch to login?"),
                        primaryButton: .destructive(Text("Go")) {
                            showLogin()
                        },
                        secondaryButton: .cancel()
                    )
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

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
