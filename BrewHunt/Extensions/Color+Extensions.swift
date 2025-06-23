//
//  Color+Extensions.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-19.
//

import SwiftUI

extension Color {
    // MARK: - Background Colors

    /// Primary background color - Dark charcoal
    /// RGB: (18, 18, 18) - #121212
    static let bhBackground = Color(red: 18, green: 18, blue: 18)

    /// Secondary background color - Medium gray
    /// RGB: (53, 53, 53) - #353535
    static let bhSecondaryBackground = Color(red: 53, green: 53, blue: 53)

    // MARK: - Text Colors

    /// Primary text color - Off white
    /// RGB: (247, 247, 247) - #F7F7F7
    static let bhPrimaryText = Color(red: 247, green: 247, blue: 247)

    /// Secondary text color - Medium gray
    /// RGB: (146, 146, 146) - #929292
    static let bhSecondaryText = Color(red: 146, green: 146, blue: 146)

    /// Tertiary text color - Light gray
    /// RGB: (184, 184, 184) - #B8B8B8
    static let bhTertiaryText = Color(red: 184, green: 184, blue: 184)

    /// Timestamp text color - Warm gray
    /// RGB: (174, 166, 166) - #AEA6A6
    static let bhTimestampText = Color(red: 174, green: 166, blue: 166)

    // MARK: - Border Colors

    /// Border color - Light gray
    /// RGB: (177, 177, 177) - #B1B1B1
    static let bhBorder = Color(red: 177, green: 177, blue: 177)

    // MARK: - Button Colors

    /// Primary button color - Blue
    /// RGB: (48, 79, 254) - #304FFE
    static let bhButtonBlue = Color(red: 48, green: 79, blue: 254)
}

extension Color {
    init(red: Int, green: Int, blue: Int, alpha: Double = 1.0) {
        self.init(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: alpha
        )
    }
}
