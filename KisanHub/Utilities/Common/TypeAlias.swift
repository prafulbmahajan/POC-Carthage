//
//  TypeAlias.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

typealias isCompleted = () -> Void
typealias JSONCompletionHandler = (Data?, String?, Error?) -> Void
typealias completionHandler = JSONCompletionHandler
