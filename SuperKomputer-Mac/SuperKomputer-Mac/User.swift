//
//  File.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

class User {
    var userName: String
    var firstName: String
    var lastName: String
    var id: Int
    var email: String
    init(inUserName: String,
         inFirstName: String,
         inLastName: String,
         userId: Int,
         inEmail: String) {
        userName = inUserName
        firstName = inFirstName
        lastName = inLastName
        email = inEmail
        id = userId
    }
}
