//
//  User.swift
//  MyGymglishApp
//
//  Created by DAGUIN Sébastien on 12/05/2021.
//

import Foundation
struct User {
    let username : String
    let password : String
    
    static let currentUser = User(username: "username", password: "password")
    
    
}
