//
//  MockDataManager.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//  Copyright © 2025 hripsimem. All rights reserved.
//

import Foundation

class MockDataManager: DataFetcher {
    func fetch<T: Decodable, R: Routing>(_ routing: R) async -> Result<T, Error> {
        let filePath = Bundle.main.path(forResource: routing.jsonPath, ofType: "json")
        
        guard let filePath else {
            return .failure(AppError.invalideLocalFile)
        }
        
        let fileUrl = URL(fileURLWithPath: filePath)
        let data = try? Data(contentsOf: fileUrl)
        
        if let dataResult = data as? T {
            return .success(dataResult)
        } 
            
        guard let data = data, let object = try? JSONDecoder().decode(T.self, from: data) else {
            return .failure(AppError.wrongFormat)
        }
        
        return .success(object)
    }
}

