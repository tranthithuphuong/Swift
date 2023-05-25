//
//  AnimalModel.swift
//  LuyenTapAPI
//
//  Created by chuottp on 23/09/2022.
//

import Foundation
struct AnimalModel: Decodable {
    let name: String
    let avatar: String
    let gender, id: String
}

typealias Animal = [AnimalModel]

