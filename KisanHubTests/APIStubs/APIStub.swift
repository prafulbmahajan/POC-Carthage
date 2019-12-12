//
//  APIStub.swift
//  KisanHubTests
//
//  Created by Praful Mahajan on 12/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation
@testable import KisanHub

//**************************************************
// MARK: - APIStub Class
//**************************************************
class APIStub {
    
    //**************************************************
    // MARK: - Properties
    //**************************************************
    var session: URLSession!

    //**************************************************
    // MARK: - Methods
    //**************************************************
    func getUserActivities(completion: @escaping(UserActivityModel?, Error?) -> Void) {
        let apiConfiguration = APIConfiguration.init(api_SubDomain: API_SUBDOMAIN.FLUTTER_TEST, api_EndPoint: API_ENDPOINT.ACTIVITIES, httpMethod: .get)
        RequestManager.withGet(apiConfiguration: apiConfiguration) { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let userActivityModel = try? decoder.decode(UserActivityModel.self, from: data)
            completion(userActivityModel, nil)
        }
    }
}
