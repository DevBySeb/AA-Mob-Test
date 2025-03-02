//
//  Routing.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//  Copyright © 2025 hripsimem. All rights reserved.
//

import Foundation

protocol Routing {
    var baseURLString: String { get }
    var method: RequestType { get }
    var routPath: String { get }
    var parameters: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
    var headers: [String: String]? { get }
    var urlRequest: URLRequest? { get }
    var queryParams: [String: String]? { get }
    var jsonPath: String? { get }
}

extension Routing {
    var baseURLString: String {
        "https://api.openbrewerydb.org/breweries/search"
    }
    
    var method: RequestType {
        .POST
    }
    
    var routPath: String {
        ""
    }
    
    var parameters: [String: Any]? {
        nil
    }
    
    var encoding: ParameterEncoding {
        ParameterEncoding.url
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var jsonPath: String? { nil }
    
    var urlRequest: URLRequest? {
        let baseURLStirng = baseURLString
        
        guard var url = URL(string: baseURLStirng) else {
            return nil
        }
        
        if !routPath.isEmpty {
            url.appendPathComponent(routPath)
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        if let queryItems = queryParams {
            urlComponents.queryItems = queryItems.map({ URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = method.rawValue
        
        if let headers = self.headers {
            for (key, value) in headers {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let parameters = self.parameters {
            do {
                urlRequest = try encoding.encode(request: urlRequest, parameters: parameters)
            } catch {
                print("parameters encoding issue")
            }
        }
        
        return urlRequest
    }
}


