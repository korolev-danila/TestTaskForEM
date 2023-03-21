//
//  ButtonBarView.swift
//  TestTaskForEM
//
//  Created by Danila on 18.03.2023.
//

import SwiftUI

struct ButtonBarView: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                        .frame(width: 40, height: 40)
                    Image("phone")
                }
                Text("Phones")
                    .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                    .font(Font.custom("Montserrat-Regular", size: 9))
                    .padding(.top, 4)
            }
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                        .frame(width: 40, height: 40)
                    Image("headPhone")
                }
                Text("Headphones")
                    .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                    .font(Font.custom("Montserrat-Regular", size: 9))
                    .padding(.top, 4)
            }
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                        .frame(width: 40, height: 40)
                    Image("game")
                }
                Text("Games")
                    .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                    .font(Font.custom("Montserrat-Regular", size: 9))
                    .padding(.top, 4)
            }
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                        .frame(width: 40, height: 40)
                    Image("car")
                }
                Text("Cars")
                    .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                    .font(Font.custom("Montserrat-Regular", size: 9))
                    .padding(.top, 4)
            }
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                        .frame(width: 40, height: 40)
                    Image("sleep")
                }
                Text("Furniture")
                    .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                    .font(Font.custom("Montserrat-Regular", size: 9))
                    .padding(.top, 4)
            }
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                        .frame(width: 40, height: 40)
                    Image("robot")
                }
                Text("kids")
                    .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                    .font(Font.custom("Montserrat-Regular", size: 9))
                    .padding(.top, 4)
            }
        }
    }
}

struct ButtonBarView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBarView()
    }
}
