//
//  RequestManager.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation

//**************************************************
// MARK: - RequestManager Class
//**************************************************
class RequestManager {

    //**************************************************
    // MARK: - GET Method
    //**************************************************
    static func withGet(apiConfiguration: APIConfiguration, completionHandler: @escaping JSONCompletionHandler) {
        let configuration = apiConfiguration.configuration()
        let session = URLSession(configuration: configuration)

        if let urlRequest = apiConfiguration.getURLRequest() {
            session.dataTask(with: urlRequest) { (data, response, error) in
                if let data = data {
                    if let json = String(data: data, encoding: String.Encoding.utf8) {
                        //print("*** Response Json *** \n\(json)")
                        completionHandler(data, json, nil)
                    }
                    else {
                        completionHandler(nil, nil, error)
                    }
                }
                else {
                    completionHandler(nil, nil, error)
                }
            }.resume()
        }
    }

    //**************************************************
    // MARK: - POST Method
    //**************************************************
    static func withPost(apiConfiguration: APIConfiguration, completionHandler: @escaping JSONCompletionHandler) {
        let configuration = apiConfiguration.configuration()
        let session = URLSession(configuration: configuration)

        if let urlRequest = apiConfiguration.postURLRequest() {
            session.dataTask(with: urlRequest) { (data, response, error) in
                if let data = data {
                    if let json = String(data: data, encoding: String.Encoding.utf8) {
                        //print("*** Response Json *** \n\(json)")
                        completionHandler(data, json, nil)
                    }
                    else {
                        completionHandler(nil, nil, error)
                    }
                }
                else {
                    completionHandler(nil, nil, error)
                }
            }.resume()
        }
    }
}
