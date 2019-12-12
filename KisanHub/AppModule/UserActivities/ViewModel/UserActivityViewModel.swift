//
//  UserActivityViewModel.swift
//  KisanHub
//
//  Created by Praful Mahajan on 11/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

//**************************************************
// MARK: - UserActivityViewModel Class
//**************************************************
class UserActivityViewModel {

    //**************************************************
    // MARK: - Properties
    //**************************************************
    var total: Int = 0
    var activities = [Activity]()
    var delegate: ViewModelToViewLoginProtocol?

    //**************************************************
    // MARK: - Methods
    //**************************************************
    init() {
        loadActivities()
    }

    private func loadActivities() {
        let apiConfiguration = APIConfiguration.init(api_SubDomain: API_SUBDOMAIN.FLUTTER_TEST, api_EndPoint: API_ENDPOINT.ACTIVITIES, httpMethod: .get)
        RequestManager.withGet(apiConfiguration: apiConfiguration) { [weak self] (data, response, error) in
            guard let data = data else { self?.delegate?.isFailed(); return }
            let decoder = JSONDecoder()
            let userActivityModel = try? decoder.decode(UserActivityModel.self, from: data)
            self?.total = userActivityModel?.total ?? 0
            self?.activities = userActivityModel?.activities ?? []
            self?.delegate?.isSccuess()
        }
    }
}
