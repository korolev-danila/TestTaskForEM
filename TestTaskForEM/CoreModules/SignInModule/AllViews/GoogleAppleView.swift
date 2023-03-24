//
//  GoogleAppleView.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct GoogleAppleView: View {
    var body: some View {
        VStack(spacing: 38) {
            Button(action: { }) {
                Label(title: {
                    Text("Sign in with Google")
                        .foregroundColor(.black)
                        .font(FontManager.regular(size: 13))
                }, icon: {
                    Image("Google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                })
            }
            
            Button(action: { }) {
                Label(title: {
                    Text("Sign in with Apple")
                        .foregroundColor(.black)
                        .font(FontManager.regular(size: 13))
                }, icon: {
                    Image("Apple")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                })
            }
            .padding(.leading, -12)
        }
    }
}
