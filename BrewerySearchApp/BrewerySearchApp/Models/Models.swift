//
//  Models.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

import Foundation
import SwiftData

@Model
final class ViewedBrewery {
    @Attribute(.unique)
    var breweryId: String
    var name: String
    var streetAddress: String
    var viewedAt: Date

    init(breweryId: String, name: String, streetAddress: String, viewedAt: Date) {
        self.breweryId = breweryId
        self.name = name
        self.streetAddress = streetAddress
        self.viewedAt = viewedAt
    }
}

struct Brewery: Codable, Identifiable {
    let id: String
    let name: String
    let breweryType: String?
    let city: String?
    let country: String?
    let phone: String?
    let websiteUrl: String?
    let street: String?

    // Only used for creating samples :innocent:
    init(
        id: String, name: String, breweryType: String? = nil, city: String? = nil,
        country: String? = nil, phone: String? = nil, websiteUrl: String? = nil, street: String? = nil
    ) {
        self.id = id
        self.name = name
        self.breweryType = breweryType
        self.city = city
        self.country = country
        self.phone = phone
        self.websiteUrl = websiteUrl
        self.street = street
    }

    static let samples: [Brewery] = (0..<10).map({ index in
        Brewery(id: "\(index)", name: "Brewery #\(index)")
    })
}

extension Brewery {
    var displayType: String {
        breweryType ?? "Uknown type Brewery"
    }

    var displayAddress: String {
        var address: String = ""
        if let street = street {
            address += "\(street)"
        }
        if let city = city {
            address += address.isEmpty ? "" : ", "
            address += "\(city)"
        }
        if let country = country {
            address += address.isEmpty ? "" : ", "
            address += "\(country)"
        }
        return address.isEmpty ? "Unknown address" : address
    }

    var displayPhone: String {
        return "\(phone ?? "Phone number not available")"
    }

    var displayWebsite: String {
        return "\(websiteUrl ?? "Website not available")"
    }

}
