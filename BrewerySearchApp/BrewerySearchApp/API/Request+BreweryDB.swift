//
//  Request+BreweryDB.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

import Foundation
import MinimalNetworking

extension Request {
    static func search(query: String) -> Request {
        var queryItems: [URLQueryItem] = []
        if !query.isEmpty {
            queryItems.append(URLQueryItem(name: "query", value: query))
            queryItems.append(URLQueryItem(name: "page", value: "1"))
        }
        queryItems.append(
            contentsOf: (OpenBreweryDBClient.baseParameters.map({ URLQueryItem(name: $0.key, value: $0.value) })))

        return Request.basic(
            baseURL: OpenBreweryDBClient.baseUrl,
            path: Endpoint.search.path,
            params: queryItems,
            headers: OpenBreweryDBClient.baseParameters)
    }

    static func details(for breweryId: String) -> Request {
        return Request.basic(
            baseURL: OpenBreweryDBClient.baseUrl,
            path: Endpoint.details(breweryId).path)
    }
}
