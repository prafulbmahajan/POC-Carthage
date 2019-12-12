//
//  UserActivityModel.swift
//  KisanHub
//
//  Created by Praful Mahajan on 11/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

//**************************************************
// MARK: - UserActivityModel Codable Struct
//**************************************************
struct UserActivityModel: Codable {
    let total: Int
    let activities: [Activity]
}

//**************************************************
// MARK: - Activity Codable Struct
//**************************************************
struct Activity: Codable {
    let activityID, date, wakeUp: String
    let wakeUpImage: String
    let totalSteps: String
    let totalStepsImage: String

    enum CodingKeys: String, CodingKey {
        case activityID = "activity_id"
        case date, wakeUp, wakeUpImage, totalSteps, totalStepsImage
    }
}
