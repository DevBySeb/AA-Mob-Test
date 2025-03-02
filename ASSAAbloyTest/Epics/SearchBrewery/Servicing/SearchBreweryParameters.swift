//
//  SearchBreweryParameters.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-26.
//

import Foundation

public struct SearchBreweryParameters: Routing {
    let queryString: String
    let itemsCount: String
    
    var method: RequestType {
        .GET
    }
    
    var encoding: ParameterEncoding {
        .json
    }
    
    var routPath: String {
        "/breweries/search"
    }
    
    var queryParams: [String: String]? {
        ["page" : "1",
         "per_page" : itemsCount,
         "query" : queryString]
    }

    var jsonPath: String? {
        "BreweryList"
    }
}
