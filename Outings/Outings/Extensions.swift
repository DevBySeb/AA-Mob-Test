//
//  Extensions.swift
//  Outings
//
//  Created by Mostafa Mazrouh on 2025-06-12.
//

import SwiftUI


extension DateFormatter {
    static let shopDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
}

extension Color {
    static var appDark: Color {
        Color(red: 18/255, green: 18/255, blue: 18/255)
    }
    
    static var appGray: Color {
        Color(red: 53/255, green: 53/255, blue: 53/255)
    }
    
    static var appBlue: Color {
        Color(red: 48/255, green: 79/255, blue: 254/255)
    }
}

extension Font {
    static var poppinsSemiBold24: Font {
        .custom("Poppins-SemiBold", size: 24)
    }
    static var poppinsRegular16: Font {
        .custom("Poppins-Regular", size: 16)
    }
    static var poppinsSemiBold16: Font {
        .custom("Poppins-SemiBold", size: 16)
    }
    static var poppinsRegular13: Font {
        .custom("Poppins-Regular", size: 13)
    }
}
