//
//  XCTestCase+Extension.swift
//  KisanHubTests
//
//  Created by Praful Mahajan on 12/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import XCTest

//**************************************************
// MARK: - XCTestCase Extension
//**************************************************
extension XCTestCase {

    //**************************************************
    // MARK: - Load API Data from the Local JSON file instead of going to the Back-End
    //**************************************************
    func getAPIData(forResource: String, ofType: String, completion: @escaping(Data?,Error?) -> Void)  {

        let testBundle = Bundle(for: type(of: self))

        if let path = testBundle.path(forResource: forResource, ofType: ofType) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                completion(data, nil)
            } catch let error {
                //print("parse error: \(error.localizedDescription)")
                completion(nil,error)
            }
        } else {
            //print("Invalid filename/path.")
            completion(nil,nil)
        }
    }
}
