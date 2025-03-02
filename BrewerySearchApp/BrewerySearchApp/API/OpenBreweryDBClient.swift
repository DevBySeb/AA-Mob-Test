//
//  OpenBreweryDBClient.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-02-28.
//
import Foundation
import MinimalNetworking

class OpenBreweryDBClient: BreweryAPI {
    static let baseUrl: URL = URL(string: "https://api.openbrewerydb.org")!

    static let baseParameters: [String: String] = [:]

    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [:]
        return config
    }()

    let api: ApiClient = ApiClient(configuration: OpenBreweryDBClient.configuration)

    func search(query: String) async throws -> [Brewery] {
        do {
            let response = try await api.send(type: [Brewery].self, with: .search(query: query))
            let result = try response.get()
            return result
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

    func details(breweryId: String) async throws -> Brewery? {
        do {
            let response = try await api.send(type: Brewery.self, with: .details(for: breweryId))
            return try response.get()
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
