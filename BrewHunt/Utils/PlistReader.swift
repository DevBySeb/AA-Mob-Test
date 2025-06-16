//
//  PlistReader.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-11.
//

import Foundation

struct PlistReader {

    static func stringValue(for key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            fatalError("The key '\(key)' was not found in the Info.plist file or is not a String type.")
        }
        return value
    }
}
