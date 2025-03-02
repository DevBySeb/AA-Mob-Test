//
//  Endpoint.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

enum Endpoint {
    case search
    case details(String)

    var path: String {
        switch self {
        case .search:
            return "breweries/search"
        case .details(let id):
            return "breweries/\(id)"
        }
    }
}
