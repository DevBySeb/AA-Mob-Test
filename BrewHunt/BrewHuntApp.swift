//
//  BrewHuntApp.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-10.
//

import SwiftUI
import SwiftData

@main
struct BrewHuntApp: App {
    var body: some Scene {
        WindowGroup {
            BrewerySearchSceneView()
        }
        .modelContainer(for: BreweryHistoryItemModel.self)
    }
}
