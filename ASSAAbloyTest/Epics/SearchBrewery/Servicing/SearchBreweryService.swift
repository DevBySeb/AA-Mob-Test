//
//  SearchBreweryService.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-26.
//

import Foundation

final class SearchBreweryService: DataFetchingManager {
    func call(with parameters: SearchBreweryParameters) async throws -> Result<[BreweryInfo], Error> {
        return await self.execute(parameters, errorType: Error.self)
    }
}
