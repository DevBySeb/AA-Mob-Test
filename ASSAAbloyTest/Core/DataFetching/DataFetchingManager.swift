//
//  DataFetchingManager.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//  Copyright © 2025 hripsimem. All rights reserved.
//

import Foundation

class DataFetchingManager {
    /// DataFetcher to fetch data
    /// Will be injected with constructor injection
    /// Can be used network or mock type
    private let dataFetcher: DataFetcher 

    init(with fetcher: DataFetcher) {
        self.dataFetcher = fetcher
    }

    func execute<T: Decodable, R: Routing, E: Error>(_ route: R, errorType: E.Type) async -> Result<T, Error> {
        return await dataFetcher.fetch(route)
    }
}

