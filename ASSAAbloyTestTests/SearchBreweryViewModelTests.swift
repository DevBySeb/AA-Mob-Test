//
//  SearchBreweryViewModelTests.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//
@testable import ASSAAbloyTest
import XCTest

final class SearchBreweryViewModelTests: XCTestCase {
    var sut: SearchBreweryViewModel!
    
    override func setUp() {
        super.setUp()
        
        sut = SearchBreweryViewModel(fetcher: MockDataManager())
    }
    
    func testWordCounterList() throws {
        sut.query = "brew"
        sut.fetchData(with: "brew")
        wait(milliseconds: 300)
        
        XCTAssertEqual(sut.breweryList.count, 5)
    }
    
    func testUpdateDate() {
        sut.fetchData(with: "brew")
        wait(milliseconds: 300)
        
        if let item = sut.breweryList.first {
            XCTAssertNil(item.dateString)

            let updatedItem = sut.updateDate(item: item)
            XCTAssertNotNil(updatedItem.dateString)
        }
    }
}
