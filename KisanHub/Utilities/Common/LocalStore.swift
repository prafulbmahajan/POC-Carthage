//
//  LocalStore.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

struct LocalStore {
    fileprivate static let userDefaults = UserDefaults.standard
    fileprivate static let kUsertoken = "kUsertoken"

    //MARK:- Usertoken
    static func setUsertoken(userToken: String) {
        userDefaults.set(userToken, forKey: kUsertoken)
        userDefaults.synchronize()
    }

    static func getUsertoken() -> String {
        if let selection = userDefaults.object(forKey: kUsertoken) as? String {
            return selection
        }
        return ""
    }

    //MARK:- Remove All LocalStore
    static func removeAllLocalStore() {
        if let domain = Bundle.main.bundleIdentifier {
            userDefaults.removePersistentDomain(forName: domain)
            userDefaults.synchronize()
        }
    }

    //MARK:- Remove Object From LocalStore
    static func removeObject(key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }
}
