//
//  RegisterViewModel.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

typealias CreateUserCallBlock = (_ user: User) -> Void

class RegisterViewModel {
    
    let apiCore = APICore()
    
    func  createUser(param:CreateUserRequestParam,
                     callBack: @escaping CreateUserCallBlock) {
        
        apiCore.createUser(param: param) { (response) in
            if response.success {
                callBack(response.user!)
            }
        }
    }
}
