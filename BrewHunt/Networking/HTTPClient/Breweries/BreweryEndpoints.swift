//
//  BreweryEndpoints.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-11.
//

import SBNetworking

struct BrewerySearchByQueryEndpoint: Endpoint {
    typealias ResponseType = [BreweryItem]

    let path = "/v1/breweries/search"
    let method: HTTPMethod = .get
    let queryParameters: [String: String]?

    let searchQuery: String
    let perPage: Int
    let page: Int

    init(searchQuery: String, perPage: Int = 10, page: Int = 1) {
        self.searchQuery = searchQuery
        self.perPage = perPage
        self.page = page
        self.queryParameters = [
            "query": searchQuery,
            "per_page": "\(perPage)",
            "page": "\(page)"
        ]
    }
}
