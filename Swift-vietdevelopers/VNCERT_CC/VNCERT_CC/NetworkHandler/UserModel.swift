//
//  UserModel.swift
//  VNCERT_CC
//
//  Created by chuottp on 07/11/2022.
//

import Foundation

struct User: Codable {
    let name, email, password, id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case password = "password"
        case id = "id"
    }
}

typealias Users = [User]
