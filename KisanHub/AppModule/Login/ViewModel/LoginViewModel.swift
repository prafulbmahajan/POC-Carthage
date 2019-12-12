//
//  LoginViewModel.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation
import UIKit

//**************************************************
// MARK: - LoginViewModel Class
//**************************************************
class LoginViewModel {

    //**************************************************
    // MARK: - Properties
    //**************************************************
    var loginRequestModel: LoginRquestModel?
    var loginResponseModel: LoginResponseModel? // We can use this variable if required

    //**************************************************
    // MARK: - Methods
    //**************************************************
    func validateLoginCredentials(userName: String?, password: String?)->(Bool, String, TextFieldType) {
        let userName = userName ?? ""
        let password = password ?? ""

        if userName.isEmpty || userName.count <= 0 {
            return (false, "Please enter email", .USERNAME)
        }
        else if password.isEmpty || password.count <= 0 {
            return (false, "Please enter password", .PASSWORD)
        }
        return (true, "", .NONE)
    }

    func setLoginRequestModel(userName: String?, password: String?) {
        self.loginRequestModel = LoginRquestModel.init(username: userName, password: password)
    }

    func getUserToken(complete: @escaping isCompleted) {

        let apiConfiguration = APIConfiguration.init(api_SubDomain: API_SUBDOMAIN.FLUTTER_TEST, api_EndPoint: API_ENDPOINT.LOGIN, extraParameters: "", httpMethod: .post, requestObject: self.loginRequestModel)
        RequestManager.withPost(apiConfiguration: apiConfiguration) { [weak self] (data, response, error) in
            guard let data = data else { complete(); return }
            let decoder = JSONDecoder()
            self?.loginResponseModel = try? decoder.decode(LoginResponseModel.self, from: data)
            self?.storeUserTokenLocally()
            complete()
        }
    }

    func storeUserTokenLocally() {
        guard let userToken = self.loginResponseModel?.userToken, userToken.count > 0  else {
            return
        }
        LocalStore.setUsertoken(userToken: userToken)
    }
}
