//
//  BreweryHistoryItemModel.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-22.
//

import Foundation
import SwiftData

@Model
final class BreweryHistoryItemModel {

    @Attribute(.unique)
    var id: String
    var timestamp: Date

    var name: String
    var breweryType: String
    var address1: String?
    var city: String?
    var country: String?
    var phone: String?
    var websiteURL: String?
    var state: String
    var street: String?

    init(
        id: String,
        timestamp: Date = Date(),
        breweryItem: BreweryItem
    ) {
        self.id = id
        self.timestamp = timestamp
        self.name = breweryItem.name
        self.breweryType = breweryItem.breweryType.rawValue
        self.address1 = breweryItem.address1
        self.city = breweryItem.city
        self.country = breweryItem.country
        self.phone = breweryItem.phone
        self.websiteURL = breweryItem.websiteURL
        self.state = breweryItem.state
        self.street = breweryItem.street
    }
}
