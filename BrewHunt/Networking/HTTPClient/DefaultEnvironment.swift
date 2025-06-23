//
//  DefaultEnvironment.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-11.
//

import Foundation
import SBNetworking

struct DefaultEnvironment: HttpClientProtocol {
    private static let scheme: String = {
        PlistReader.stringValue(for: "API_SCHEME")
    }()

    private static let baseURL: String = {
        PlistReader.stringValue(for: "API_BASE_URL")
    }()

    let environment = HTTPClientEnvironment(
        scheme: Self.scheme,
        baseURL: Self.baseURL
    )
}
