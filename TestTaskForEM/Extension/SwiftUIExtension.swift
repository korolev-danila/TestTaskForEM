//
//  SwiftUIExtension.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import SwiftUI

/// like a UIKit isHidden method
struct Show: ViewModifier {
    let isVisible: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            content
        } else {
            content.hidden()
        }
    }
}

extension View {
    /// like a UIKit isHidden method
    func show(isVisible: Bool) -> some View {
        ModifiedContent(content: self, modifier: Show(isVisible: isVisible))
    }
    
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

extension View {
    func priceFormater(_ value: Double) -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: value)
        
        if value < 1000 {
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return String(formatter.string(from: number) ?? "")
        } else {
            formatter.groupingSeparator = ","
            formatter.numberStyle = .decimal
            return String(formatter.string(from: number) ?? "")
        }
    }
}

extension Image {
    /// Initializes a SwiftUI `Image` from data.
    init?(data: Data) {
        if let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
