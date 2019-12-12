//
//  MockURLSession.swift
//  KisanHubTests
//
//  Created by Praful Mahajan on 12/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

//**************************************************
// MARK: - MockURLSession Class
//**************************************************
class MockURLSession: URLSession {

    //**************************************************
    // MARK: - Properties
    //**************************************************
    var cachedURL: URL?
    private let mockTask: MockTask

    //**************************************************
    // MARK: - Methods
    //**************************************************
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.mockTask = MockTask(data: data, urlResponse: urlResponse, error: error)
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedURL = url
        self.mockTask.completionHandler = completionHandler
        return mockTask
    }
}
