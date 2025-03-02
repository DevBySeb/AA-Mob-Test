//
//  XCTestCase+Wait.swift
//  ASSAAbloyTestTests
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//  Copyright © 2025 hripsimem. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func wait(milliseconds: Int = 1) {
        let delayExpectation = expectation(description: "Waiting for async task to execute")
        let dispatchTime = DispatchTime.now() + .milliseconds(milliseconds)

        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: TimeInterval(milliseconds + 1))
    }
}
