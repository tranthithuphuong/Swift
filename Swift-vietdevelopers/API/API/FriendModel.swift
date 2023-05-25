//
//  FriendModel.swift
//  API
//
//  Created by chuottp on 15/11/2022.
//

import Foundation
struct FriendModel: Decodable {
    let name: String
    let avatar: String
    let id: String
}

typealias Friend = [FriendModel]
