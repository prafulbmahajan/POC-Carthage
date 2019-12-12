//
//  CommonMethods.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation
import UIKit

//**************************************************
// MARK: - CommonMethods Class
//**************************************************
class CommonMethods {

    //**************************************************
    // MARK: - Methods
    //**************************************************
    static func getViewControllerFromStoryBoard<T: UIViewController>(type: T.Type, storyBoard: Storyboard) -> T? {
        var fullName: String = NSStringFromClass(T.self)
        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        if let range = fullName.range(of:".", options:.backwards, range:nil, locale: nil){
            fullName = String(fullName[range.upperBound...])
        }
        return storyboard.instantiateViewController(withIdentifier:fullName) as? T
    }

    static func setRootViewController(viewController: UIViewController) {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
            keyWindow?.rootViewController = viewController
        }
    }
}
