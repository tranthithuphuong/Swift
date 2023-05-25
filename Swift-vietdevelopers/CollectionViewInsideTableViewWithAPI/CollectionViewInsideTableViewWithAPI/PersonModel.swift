//
//  PersonModel.swift
//  CollectionViewInsideTableViewWithAPI
//
//  Created by chuottp on 28/09/2022.
//

import Foundation
struct PersonModel: Decodable {
    let name: String
    let avatar: String
    let id: String
}

typealias Persons = [PersonModel]
