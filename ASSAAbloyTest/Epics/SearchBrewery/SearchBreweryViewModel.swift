//
//  SearchBreweryViewModel.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-26.
//

import Foundation
import RealmSwift
import Combine

final class SearchBreweryViewModel: ObservableObject {
    @Published var query = ""
    @Published private(set) var breweryList: [Brewery] = []
    @Published private(set) var historyList: [Brewery] = []
    @Published private(set) var showMore: Bool = true
    
    // MARK: Private members
    private let searchBreweryService: SearchBreweryService
    private var cancellables = Set<AnyCancellable>()
    private var realm: Realm
    private var initialItemsCount = 5
    private let maxCount = 10
    
    public init(fetcher: DataFetcher = NetworkManager()) {
        self.searchBreweryService = SearchBreweryService(with: fetcher)
        
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
        
        $query
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] newQuery in
                if newQuery.count >= 3 {
                    self?.fetchData(with: newQuery)
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchData(with searchString: String) {
        let parameters = SearchBreweryParameters(queryString: searchString,
                                                 itemsCount: String(initialItemsCount))
        
        Task {
            do {
                let response = try await searchBreweryService.call(with: parameters).get()
                
                let breweryList = response.map({ Brewery(from: $0) })
                
                await MainActor.run {
                    self.breweryList = breweryList
                }
            } catch {
                // Error view need to be presented, missing in figma
            }
        }
    }
    
    // MARK: Public API
    func showAll() {
        if initialItemsCount < maxCount {
            showMore = false
            initialItemsCount = maxCount
            fetchData(with: query)
        }
    }
    
    func saveItem(item: Brewery) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = dateFormatter.string(from: currentDate)
        
        do {
            try realm.write {
                item.dateString = dateString
                
                realm.add(item, update: .modified)
            }
        } catch {
            print("Error adding/updating Brewery: \(error)")
        }
    }
    
    func fetchHistory() {
        let list = realm.objects(Brewery.self)
        let breweryList = Array(list)
        
        if !breweryList.isEmpty {
            Task { @MainActor in
                self.historyList = breweryList
            }
        }
    }
}

