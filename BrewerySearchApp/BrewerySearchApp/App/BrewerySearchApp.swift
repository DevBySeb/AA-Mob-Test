//
//  BrewerySearchApp.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-02-28.
//

import SwiftData
import SwiftUI

@main
struct BrewerySearchApp: App {

    let sharedModelContainer: ModelContainer

    init() {
        let schema = Schema([ViewedBrewery.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    let api: BreweryAPI = OpenBreweryDBClient()
    let mocker: BreweryAPI = MockBrewery()

    var body: some Scene {
        WindowGroup {
            SearchView(api: api)
        }
        .modelContainer(sharedModelContainer)
    }
}
