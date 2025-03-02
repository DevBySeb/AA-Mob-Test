//
//  String+Extension.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//  Copyright © 2025 hripsimem. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, comment: "")
    }
}

