//
//  ASSAAbloyTestApp.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-02.
//

import SwiftUI
import SwiftData

@main
struct ASSAAbloyTestApp: App {
    let sharedModelContainer: ModelContainer

    init() {
        let schema = Schema([Brewery.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            SearchBreweryView()
        }
        .modelContainer(sharedModelContainer)
    }
}
