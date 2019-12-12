//
//  MockTask.swift
//  KisanHubTests
//
//  Created by Praful Mahajan on 12/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

//**************************************************
// MARK: - MockTask Class
//**************************************************
class MockTask: URLSessionDataTask {
    
    //**************************************************
    // MARK: - Properties
    //**************************************************
    private let data: Data?
    private let urlResponse: URLResponse?
    private lazy  var _error: Error? = nil
    override var error: Error? {
        get { return _error}
        set { _error = newValue}
    }
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    
    //**************************************************
    // MARK: - Methods
    //**************************************************
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
    }
    
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler?(self.data, self.urlResponse, self.error)
        }
    }
}
