//
//  PersonModel.swift
//  MultiChoiceItem
//
//  Created by chuottp on 30/09/2022.
//

import Foundation
struct PersonElement: Codable {
    let name: String
    let avatar: String
    let id: String
}

typealias Person = [PersonElement]
