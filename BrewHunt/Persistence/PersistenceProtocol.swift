//
//  PersistenceProtocol.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-22.
//

import Foundation
import SwiftData

protocol PersistenceProtocol {
    var modelContext: ModelContext? { get }

    func fetchPersistentItems<T: PersistentModel>() -> [T]
    func removePersistentItem<T: PersistentModel>(_ item: T) throws
    func addPersistentItem<T: PersistentModel>(_ item: T) throws
}

extension PersistenceProtocol {
    func fetchPersistentItems<T: PersistentModel>() -> [T] {
        let fetchDescriptor = FetchDescriptor<T>()
        let items = try? modelContext?.fetch(fetchDescriptor)
        return items ?? []
    }

    func removePersistentItem<T: PersistentModel>(_ item: T) throws {
        modelContext?.delete(item)
        try modelContext?.save()
    }

    func addPersistentItem<T: PersistentModel>(_ item: T) throws {
        modelContext?.insert(item)
        try modelContext?.save()
    }
}
