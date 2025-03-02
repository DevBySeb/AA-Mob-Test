//
//  BreweryInfo.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-26.
//

import Foundation


import Foundation

public struct BreweryInfo: Decodable {
    public let id: String
    public let name: String
    public let country: String?
    public let phone: String?
    public let address: String?
    public let city: String?
    public let state: String?
    public let street: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case phone
        case address = "address_1"
        case city
        case state
        case street
    }
}
