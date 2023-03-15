//
//  SwiftUIExtension.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import SwiftUI

extension View {
    /// it is necessary for customization placeholder at textfields
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
