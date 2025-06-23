//
//  Font+Extensions.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-16.
//

import SwiftUI

extension Font {

    private enum Poppins: String {
        case regular = "Poppins-Regular"
        case medium = "Poppins-Medium"
        case semibold = "Poppins-SemiBold"
        case bold = "Poppins-Bold"
    }

    static func poppinsRegular(size: CGFloat) -> Font {
        return customFont(.regular, size: size)
    }

    static func poppinsMedium(size: CGFloat) -> Font {
        return customFont(.medium, size: size)
    }

    static func poppinsSemiBold(size: CGFloat) -> Font {
        return customFont(.semibold, size: size)
    }

    static func poppinsBold(size: CGFloat) -> Font {
        return customFont(.bold, size: size)
    }

    private static func customFont(_ font: Poppins, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }
}
