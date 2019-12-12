//
//  LoginResponseModel.swift
//  KisanHub
//
//  Created by Praful Mahajan on 11/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

//**************************************************
// MARK: - LoginResponseModel Codable Struct
//**************************************************
struct LoginResponseModel: Codable {
    var userToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case userToken
    }
}
