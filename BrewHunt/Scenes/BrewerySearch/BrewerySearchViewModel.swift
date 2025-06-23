//
//  BrewerySearchViewModel.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-19.
//

import Foundation
import Observation
import SwiftData

enum BrewerySearchState {
    case empty
    case loading
    case success
    case history
    case error(message: String)
}

@Observable
final class BrewerySearchViewModel: PersistenceProtocol {
    // MARK: - Properties
    private(set) var state: BrewerySearchState = .empty
    private(set) var searchHistory: [BreweryItemPresenter] = []
    private(set) var searchResults: [BreweryItemPresenter] = []
    private(set) var showAllResults: Bool = false

    private let httpClient = HTTPClientWrapper().client
    private(set) var modelContext: ModelContext?
    private var debounceTimer: Timer?

    var searchText: String = "" {
        didSet {
            if oldValue == searchText { return }
            debounceSearch()
        }
    }

    // MARK: - Computed Properties

    var displayedBreweries: [BreweryItemPresenter] {
        switch state {
        case .success:
            return showAllResults ? searchResults : Array(searchResults.prefix(5))
        default:
            return []
        }
    }

    var hasMoreResults: Bool {
        switch state {
        case .success:
            return searchResults.count > 5
        default:
            return false
        }
    }

    // MARK: - Public Methods

    func setModelContext(_ modelContext: ModelContext?) {
        self.modelContext = modelContext
        loadSearchHistory()
        self.state = searchHistory.isEmpty ? .empty : .history
    }

    func saveBrewery(_ brewery: BreweryItemPresenter) {
        guard !searchHistory.contains(where: { $0.id == brewery.id }) else { return }
        let historyItem = brewery.toBreweryHistoryItemModel()
        do {
            try addPersistentItem(historyItem)
            searchHistory.append(BreweryItemPresenter.fromHistoryItemModel(historyItem))
        } catch {
            state = .error(message: "Failed to save brewery history. \(error.localizedDescription)")
        }
    }

    func toggleShowMore() {
        showAllResults.toggle()
    }

    // MARK: - Private Methods

    private func performSearch(for term: String) {
        state = .loading

        Task {
            do {
                let endpoint = BrewerySearchByQueryEndpoint(searchQuery: term, perPage: 10)
                let breweries = try await httpClient.submitRequest(endpoint: endpoint) ?? []
                let presenters = breweries.map { BreweryItemPresenter.fromBreweryItem($0) }

                await MainActor.run {  [weak self] in
                    if breweries.isEmpty {
                        self?.state = .error(message: "No breweries found for '\(term)'")
                    } else {
                        self?.searchResults = presenters
                        self?.state = .success
                        self?.showAllResults = false
                    }
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.state = .error(message: "Failed to search breweries. \(error.localizedDescription)")
                }
            }
        }
    }

    private func debounceSearch() {
        debounceTimer?.invalidate()

        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard query.count > 2 else {
            state = searchHistory.isEmpty ? .empty : .history
            return
        }

        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            self?.performSearch(for: query)
        }
    }

    private func loadSearchHistory() {
        let historyItems: [BreweryHistoryItemModel] = fetchPersistentItems()
        self.searchHistory = historyItems.map { BreweryItemPresenter.fromHistoryItemModel($0) }
    }
}
