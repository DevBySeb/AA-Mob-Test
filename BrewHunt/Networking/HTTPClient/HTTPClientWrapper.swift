//
//  HTTPClientWrapper.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-11.
//

import Foundation
import SBNetworking

struct HTTPClientWrapper {

    let client: HTTPClient

    init(client: HttpClientProtocol = DefaultEnvironment()) {
        self.client = HTTPClient(client: client)
    }
}
