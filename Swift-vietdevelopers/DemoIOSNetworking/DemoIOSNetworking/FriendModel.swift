//
//  FriendModel.swift
//  DemoIOSNetworking
//
//  Created by chuottp on 22/09/2022.
//

import Foundation

struct FriendModel: Decodable {
    let name: String
    let avatar: String
    let id: String
}

typealias Friends = [FriendModel]
