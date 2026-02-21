//
//  OutingsTests.swift
//  OutingsTests
//
//  Created by Mostafa Mazrouh on 2025-06-07.
//

import Testing
@testable import Outings


struct ShopVMTests {
    
    @Test
    func testShopVM() async throws {
        
        let shopVM = ShopVM(repo: ShopRepoMock())
        
        // Pre-run expectations:
        #expect(shopVM.shops.isEmpty == true)
        
        await shopVM.searchShops(query: "Fun")
        #expect(shopVM.shops.count > 1)
        #expect(shopVM.shops[0].city == "Fort Collins")
    }
    
    
}
