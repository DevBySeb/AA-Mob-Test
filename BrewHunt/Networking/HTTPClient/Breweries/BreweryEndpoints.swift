//
//  BreweryEndpoints.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-11.
//

import SBNetworking

struct BrewerySearchEndpoint: Endpoint{
    typealias ResponseType = [BreweryItem]
    let path = "/v1/breweries"
    let method: HTTPMethod = .get
    var queryParameters: [String: String]? {
        return [
            "per_page": "200",
        ]
    }
}
