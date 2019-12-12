//
//  LoginRequestModel.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

//**************************************************
// MARK: - LoginRquestModel Struct
//**************************************************
struct LoginRquestModel: Encodable {

    //**************************************************
    // MARK: - Properties
    //**************************************************
    var username: String?
    var password: String?

    //**************************************************
    // MARK: - Initializer
    //**************************************************
    init(username: String?, password: String?) {
        self.username = username
        self.password = password
    }
}
