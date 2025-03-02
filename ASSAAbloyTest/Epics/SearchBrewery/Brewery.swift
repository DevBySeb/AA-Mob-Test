//
//  Brewery.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-28.
//

import Foundation
import SwiftData

@Model
final class Brewery {
     @Attribute(.unique)
     var id: String
     var name: String
     var country: String?
     var phone: String?
     var address: String?
     var city: String?
     var state: String?
     var street: String?
     var dateString: String?

    init(from model: BreweryInfo) {
        self.id = model.id
        self.name = model.name
        self.country = model.country
        self.phone = model.phone
        self.city = model.city
        self.address = model.address
        self.state = model.state
        self.street = model.street
    }
}
