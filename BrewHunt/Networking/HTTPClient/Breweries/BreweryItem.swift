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
    let city: String?
    let country: String?
    let phone: String?
    let websiteURL: String?
    let state: String
    let street: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case breweryType = "brewery_type"
        case address1 = "address_1"
        case city
        case country
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
