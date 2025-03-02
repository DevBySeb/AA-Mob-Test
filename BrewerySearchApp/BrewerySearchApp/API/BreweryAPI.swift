//
//  BreweryAPI.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//
import SwiftUI

protocol BreweryAPI {
    func search(query: String) async throws -> [Brewery]
    func details(breweryId: String) async throws -> Brewery?
}
