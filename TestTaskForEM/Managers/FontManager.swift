//
//  FontManager.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

final class FontManager {

    static func bold(size: CGFloat) -> Font {
        return Font.custom("Montserrat-Bold", size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", size: size)
    }
    
    static func light(size: CGFloat) -> Font {
        return Font.custom("Montserrat-Light", size: size)
    }
    
    static func thin(size: CGFloat) -> Font {
        return Font.custom("Montserrat-Thin", size: size)
    }
}

