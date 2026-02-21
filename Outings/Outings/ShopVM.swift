//
//  ShopVM.swift
//  Outings
//
//  Created by Mostafa Mazrouh on 2025-06-12.
//

import SwiftUI


@Observable
class ShopVM {
    private let repo: ShopRepoInterface
    var shops: [Shop] = []
    
    private var debounceTimer: Timer?
    
    var searchText: String = "" {
        didSet {
            debounceSearch(with: searchText)
        }
    }
    
    init(repo: ShopRepoInterface = ShopRepo()) {
        self.repo = repo
    }
    
    func debounceSearch(with query: String) {
        debounceTimer?.invalidate()
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
            Task {
                await self?.searchShops(query: query)
            }
        }
    }
    
    func searchShops(query: String) async {
        do {
            let results = try await repo.searchShops(query: query)
            await updateShops(shops: results)
        } catch {
            print("Error fetching shops: \(error)")
            await updateShops(shops: [])
        }
    }
    
    @MainActor
    private func updateShops(shops: [Shop]) {
        withAnimation {
            self.shops = shops
        }
    }
}
