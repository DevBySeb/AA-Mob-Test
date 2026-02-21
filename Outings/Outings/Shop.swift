//
//  Shop.swift
//  Outings
//
//  Created by Mostafa Mazrouh on 2025-06-12.
//

import SwiftData
import Foundation


@Model
class Shop: Codable, Identifiable {
    var id: UUID
    var name: String?
    var breweryType: String?
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
    var state: String?
    var street: String?
    
    var createdAt: Date?
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        breweryType = try container.decodeIfPresent(String.self, forKey: .breweryType)
        address1 = try container.decodeIfPresent(String.self, forKey: .address1)
        address2 = try container.decodeIfPresent(String.self, forKey: .address2)
        address3 = try container.decodeIfPresent(String.self, forKey: .address3)
        city = try container.decodeIfPresent(String.self, forKey: .city)
        stateProvince = try container.decodeIfPresent(String.self, forKey: .stateProvince)
        postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
        websiteURL = try container.decodeIfPresent(String.self, forKey: .websiteURL)
        state = try container.decodeIfPresent(String.self, forKey: .state)
        street = try container.decodeIfPresent(String.self, forKey: .street)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(breweryType, forKey: .breweryType)
        try container.encode(address1, forKey: .address1)
        try container.encode(address2, forKey: .address2)
        try container.encode(address3, forKey: .address3)
        try container.encode(city, forKey: .city)
        try container.encode(stateProvince, forKey: .stateProvince)
        try container.encode(postalCode, forKey: .postalCode)
        try container.encode(country, forKey: .country)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(phone, forKey: .phone)
        try container.encode(websiteURL, forKey: .websiteURL)
        try container.encode(state, forKey: .state)
        try container.encode(street, forKey: .street)
    }
    
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
