//
//  DateFormatter+Extensions.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-23.
//

import Foundation

extension DateFormatter {
    static let historyTimestampFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
}
