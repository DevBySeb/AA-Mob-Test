//
//  BreweryItem.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-11.
//

import Foundation

struct BreweryItem: Decodable, Identifiable {
    let id: String
    let name: String
    let breweryType: BreweryType
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String
    let stateProvince: String
    let postalCode: String
    let country: String
    let longitude: Double?
    let latitude: Double?
    let phone: String?
    let websiteURL: String?
    let state: String
    let street: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case breweryType = "brewery_type"
        case address1 = "address_1"
        case address2 = "address_2"
        case address3 = "address_3"
        case city
        case stateProvince = "state_province"
        case postalCode = "postal_code"
        case country
        case longitude
        case latitude
        case phone
        case websiteURL = "website_url"
        case state
        case street
    }
}

enum BreweryType: String, CustomStringConvertible, Decodable {
    case large
    case taproom
    case micro
    case brewpub
    case closed
    case regional
    case proprietor
    case planning
    case contract
    case other

    var description: String {
        self.rawValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = BreweryType(rawValue: value) ?? .other
    }
}
