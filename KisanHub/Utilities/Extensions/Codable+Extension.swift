//
//  Codable+Extension.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
