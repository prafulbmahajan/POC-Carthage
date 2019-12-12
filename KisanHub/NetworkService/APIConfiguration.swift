//
//  APIConfiguration.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation
import UIKit

//**************************************************
// MARK: - APIConfiguration Class
//**************************************************
class APIConfiguration {
    var api_SubDomain: String
    var api_EndPoint: String
    var extraParameters: String
    var httpMethod: HTTPMethod
    var requestObject: Encodable?

    //**************************************************
    // MARK: - Initialize Method
    //**************************************************
    init(api_SubDomain: String = "", api_EndPoint: String = "", extraParameters: String = "", httpMethod: HTTPMethod = .get, requestObject: Encodable? = nil) {
        self.api_SubDomain = api_SubDomain
        self.api_EndPoint = api_EndPoint
        self.extraParameters = extraParameters
        self.httpMethod = httpMethod
        self.requestObject = requestObject
    }

    //**************************************************
    // MARK: - Fileprivate Methods
    //**************************************************
    fileprivate func getUrl() -> URL? {

        let urlString = String(format: "%@%@%@%@", Basic.url, self.api_SubDomain, self.api_EndPoint, self.extraParameters)
        //print("*** Request Url ***\n\(urlString)")
        return URL.init(string: urlString)
    }

    fileprivate func httpBody()-> Data? {
        var data: Data?
        if let jsonData = self.requestObject?.toJSONData() {
            let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            //print("*** Request Json *** \n\(jsonString)")
            data = jsonString.replacingOccurrences(of: "\\", with: "", options: .literal, range: nil).data(using: .utf8, allowLossyConversion: false)
        }
        return data
    }

    //**************************************************
    // MARK: - Methods
    //**************************************************
    func configuration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Basic.TIME_OUT
        return configuration
    }

    func getURLRequest() -> URLRequest? {
        guard let url = getUrl() else { return nil }
        return URLRequest.init(url: url)
    }

    func postURLRequest() -> URLRequest? {
        guard let url = getUrl() else { return nil }
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = HEADERS.appJson
        urlRequest.httpBody = self.httpBody()
        return urlRequest
    }
}
