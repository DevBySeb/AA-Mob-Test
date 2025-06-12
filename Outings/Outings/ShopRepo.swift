//
//  ShopRepo.swift
//  Outings
//
//  Created by Mostafa Mazrouh on 2025-06-12.
//

import Foundation

protocol ShopRepoInterface {
    /// Searches for shops matching the given query.
    /// - Parameter query: The search term.
    /// - Returns: An array of `Shop` models.
    
    init(urlString: String)
    func searchShops(query: String) async throws -> [Shop]
}

struct ShopRepoMock: ShopRepoInterface {
    
    let urlString: String
    
    init(urlString: String = "MokedURL") {
        self.urlString = urlString
    }
    
    func searchShops(query: String) async throws -> [Shop] {
        guard let url = Bundle.main.url(forResource: "Shop", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load Shop.json")
            return []
        }
        
        let decoder = JSONDecoder()
        do {
            let shops = try decoder.decode([Shop].self, from: data)
            return shops
        } catch {
            print("Decoding error: \(error)")
            return []
        }
    }
}

struct ShopRepo: ShopRepoInterface {
    
    let urlString: String
    
    init(urlString: String = "https://api.openbrewerydb.org/v1/breweries/search?page=1&per_page=10&query=") {
        self.urlString = urlString
    }
    
    /// Searches the Open Brewery DB for breweries matching the given query.
    /// - Parameter query: The search term to query breweries.
    /// - Returns: An array of `Shop` models decoded from the API response.
    func searchShops(query: String) async throws -> [Shop] {
        // Percent-encode the query to safely include it in a URL
        guard
            let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            encoded.isEmpty == false, // empty search
            let url = URL(string: "https://api.openbrewerydb.org/v1/breweries/search?page=1&per_page=10&query=\(encoded)")
        else {
            return []
        }
        
        // Perform network request
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check for a valid HTTP response
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        // Decode JSON into [Shop]
        let decoder = JSONDecoder()
        return try decoder.decode([Shop].self, from: data)
    }
}
