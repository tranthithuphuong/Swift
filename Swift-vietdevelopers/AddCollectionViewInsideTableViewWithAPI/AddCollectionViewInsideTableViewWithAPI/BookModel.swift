//
//  BookModel.swift
//  AddCollectionViewInsideTableViewWithAPI
//
//  Created by chuottp on 28/09/2022.
//

import Foundation
struct BookModel: Decodable {
    let price, avatar, id: String
}

typealias Books = [BookModel]
