//
//  FriendModel.swift
//  APITableCollection
//
//  Created by Dương Văn Cường on 27/09/2022.
//

import Foundation

struct FriendModel: Decodable {
    let name: String
    let avatar: String
    let id: String
}

typealias Friends = [FriendModel]
