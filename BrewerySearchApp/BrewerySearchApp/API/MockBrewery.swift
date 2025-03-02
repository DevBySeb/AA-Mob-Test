//
//  MockBrewery.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

struct MockBrewery: BreweryAPI {
    func search(query: String) async throws -> [Brewery] {
        Brewery.samples
    }

    func details(breweryId: String) async throws -> Brewery? {
        Brewery.samples.first
    }

}
