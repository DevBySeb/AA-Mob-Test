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
    var address2: String?
    var address3: String?
    var city: String?
    var stateProvince: String?
    var postalCode: String?
    var country: String?
    var longitude: Double?
    var latitude: Double?
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
        self.address2 = breweryItem.address2
        self.address3 = breweryItem.address3
        self.city = breweryItem.city
        self.stateProvince = breweryItem.stateProvince
        self.postalCode = breweryItem.postalCode
        self.country = breweryItem.country
        self.longitude = breweryItem.longitude
        self.latitude = breweryItem.latitude
        self.phone = breweryItem.phone
        self.websiteURL = breweryItem.websiteURL
        self.state = breweryItem.state
        self.street = breweryItem.street
    }
}
