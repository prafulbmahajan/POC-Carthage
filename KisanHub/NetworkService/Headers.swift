//
//  Headers.swift
//  KisanHub
//
//  Created by Praful Mahajan on 13/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

struct HEADERS {
    static let urlEncoded: [String: String] = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8","Accept":"application/json; charset=UTF-8","cache-control": "no-cache"]
    static let appJson: [String: String] = ["Content-Type":"application/json; charset=UTF-8", "Accept":"application/json; charset=UTF-8","cache-control": "no-cache"]
    static let multipart: [String: String] = ["Content-type": "multipart/form-data"]
}
