//
//  NetworkManager.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//  Copyright © 2025 hripsimem. All rights reserved.
//

import Foundation

enum AppError: Error, Equatable {
    case generic
    case badURL
    case response(urlError: URLError)
    case invalideLocalFile
    case wrongFormat
}

protocol DataFetcher {
    func fetch<T: Decodable, R: Routing>(_ routing: R) async -> Result<T, Error>
}

final class NetworkManager: DataFetcher {
    func fetch<T: Decodable, R: Routing>(_ routing: R) async -> Result<T, Error> {
        let session = URLSession(configuration: .default)

        guard let url = routing.urlRequest else {
            fatalError("Could not create url")
        }

        do {
            let result = try await dataTaskExecution(request: url, session: session)
            if let dataResult = result.data as? T {
                return .success(dataResult)
            } else {
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: result.data) else {
                    fatalError("Could not decode data")
                }
                        
                return .success(decodedResponse)
            }

        }  catch let error {
            return .failure(error)
        }
    }
    
    private func dataTaskExecution(request: URLRequest, session: URLSession) async throws -> HTTPClientResponse {
        guard let url = request.url else {
            throw AppError.badURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw AppError.response(
                urlError: URLError(.badServerResponse)
            )
        }

        return HTTPClientResponse(data: data, response: httpResponse)
    }
}

struct HTTPClientResponse: Sendable {
    let data: Data
    let response: HTTPURLResponse
}
