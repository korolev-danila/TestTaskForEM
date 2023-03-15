//
//  LoginView.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = SignInViewModel()
    var showMain: () -> () = { }
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack() {
            Image("Welcome")
                .resizable()
                .scaledToFit()
                .frame(width: 195.63, height: 20, alignment: .center)
                .padding(77.77)
            
            VStack(alignment: .center, spacing: 35) {
                TextField("", text: $username)
                    .placeholder(when: username.isEmpty) {
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
                            SecureField("", text: $password)
                        } else {
                            TextField("", text: $password)
                        }
                    }
                    .animation(.easeInOut(duration: 0.2), value: isSecure)
                    .placeholder(when: password.isEmpty) {
                        Text("Password").foregroundColor(Color(red: 123/255,
                                                               green: 123/255,
                                                               blue: 123/255))
                        .font(Font.custom("Montserrat-Regular", size: 11))
                    }
                    .frame(width: 261, height: 29)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 36))
                    .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .clipShape(Capsule())
                    
                    Button(action: {
                        isSecure.toggle()
                    }, label: {
                        Image(systemName: !isSecure ? "eye.slash" : "eye" )
                            .foregroundColor(Color(red: 123/255, green: 123/255,
                                                   blue: 123/255))
                    })
                    .padding(.leading, -44)
                }
                .padding(.leading, 8)
            }
            
            Button(action: showMain) {
                Label(title: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(Font.custom("Montserrat-Bold", size: 15))
                }, icon: {})
            }
            .frame(width: 305, height: 46)
            .background(Color(red: 78/255, green: 85/255, blue: 215/255))
            .cornerRadius(15)
            .padding(.top, 66)
            Spacer()
        }
        .padding(.top, 66)
        .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
