//
//  KisanHubTests.swift
//  KisanHubTests
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import XCTest
@testable import KisanHub

//**************************************************
// MARK: - KisanHub Test Class
//**************************************************
class KisanHubTests: XCTestCase {

    //**************************************************
    // MARK: - Properties
    //**************************************************
    let apiStub = APIStub()

    //**************************************************
    // MARK: - Default Test Methods
    //**************************************************
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    //**************************************************
    // MARK: - Custom Test Cases
    //**************************************************
    func testUserActivities() {
        let userActivitiesExpectation = expectation(description: "User Activities")
        var userActivities = [Activity]()
        getAPIData(forResource: "Activity", ofType: "json") { [weak self] (data, error) in
            let mockURLSession = MockURLSession(data: data, urlResponse: nil, error: nil)
            self?.apiStub.session = mockURLSession
            self?.apiStub.getUserActivities(completion: { (userActivityModel, error) in
                userActivities = userActivityModel?.activities ?? []
                userActivitiesExpectation.fulfill()
            })
        }
        waitForExpectations(timeout: 5) { (_ error) in
            XCTAssert(userActivities.count > 0)
        }
    }
}
