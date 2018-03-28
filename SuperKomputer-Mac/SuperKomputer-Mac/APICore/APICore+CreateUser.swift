//
//  APICore+CreateUser.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

struct CreateUserRequestParam {
    var user: User
    
    fileprivate var userDict: [String: Any] {
        var param: [String:Any] = [:]
        param["username"] = user.userName
        param["firstname"] = user.firstName
        param["lastname"] = user.lastName
        param["email"] = user.email
        param["id"] = user.id
        
        return param
    }
}

struct CreateUserResponseParam {
    var success: Bool
    var user: User?
    var error: Error?
}

typealias CreateUserBlock = (_ responseParam: CreateUserResponseParam) -> Void

extension APICore {
    
    func createUser(param: CreateUserRequestParam, callBack: @escaping CreateUserBlock) {
        
        let session = URLSession.shared
        let urlString = kBaseURL.appending("/v1/users")
        
        guard let url = URL(string: urlString)  else {
            let response = CreateUserResponseParam(success: false,
                                                user: nil,
                                                error: nil)
            callBack(response)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

        do {
          try urlRequest.httpBody = JSONSerialization.data(withJSONObject: param.userDict, options: [])
        }
        catch {
            let response = CreateUserResponseParam(success: false,
                                                   user: nil,
                                                   error: nil)
            callBack(response)
        }
        
        let createTask = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            // TODO: Need to revist, need to check the ststus code for craete user flow
            if error != nil {
                let responseParam = CreateUserResponseParam(success: false,
                                                       user: param.user,
                                                       error: nil)
                callBack(responseParam)
            }
        })
        createTask.resume()
    }
}
