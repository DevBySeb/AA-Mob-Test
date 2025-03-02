//
//  SearchBreweryViewModelTests.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//
@testable import ASSAAbloyTest
import XCTest
import RealmSwift

final class SearchBreweryViewModelTests: XCTestCase {
    var sut: SearchBreweryViewModel!
    var realm: Realm!
    
    override func setUp() {
        super.setUp()
        
        sut = SearchBreweryViewModel(fetcher: MockDataManager())
        
        let config = Realm.Configuration(inMemoryIdentifier: "TestRealm")
        realm = try! Realm(configuration: config)
    }
    
    func testFetchEmptyHistory() throws {
        realm.deleteAll()
        sut.fetchHistory()
        
        wait()
        
        XCTAssertEqual(sut.historyList.count, 0)
    }
    
    func testWordCounterList() throws {
        sut.query = "brew"
        sut.fetchData(with: "brew")
        wait(milliseconds: 300)
        
        XCTAssertEqual(sut.breweryList.count, 5)
    }
    
    func testSaveItem() {
        // Given: A Brewery item
        let brewery = Brewery()
        brewery.id = "123"
        brewery.name = "Test Brewery"
        
        // When: Save item to Realm
        sut.saveItem(item: brewery)
        
        // Then: Retrieve item and verify it exists
        sut.fetchHistory()
       
        wait()
        
        // Validate date format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        XCTAssertEqual(sut.historyList.count, 1)
        XCTAssertNotNil(dateFormatter.date(from: sut.historyList.first?.dateString ?? ""), "The date format should be correct")
        XCTAssertEqual(sut.historyList.first?.name, "Test Brewery")
    }
}

