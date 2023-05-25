//
//  APIHandler.swift
//  DemoAPINetworkingWithAlamofire
//
//  Created by blackhat on 22/09/2022.
//

import Foundation
import Alamofire

class APIHandler {
    func getFriends(completion: @escaping (Friends) -> ()) {
        AF.request("https://625c2d5cc9e78a8cb9b4cec1.mockapi.io/friends", method: .get).responseDecodable(of: Friends.self) { (response) in
            if let friendsResponse = response.value {
                completion(friendsResponse)
            }
        }
    }
    //Thêm thông tin qua phương thức post
    func postFriends(friend: Friend) {
        AF.request("https://625c2d5cc9e78a8cb9b4cec1.mockapi.io/friends", method: .post, parameters: friend, encoder: JSONParameterEncoder.default, headers: nil).response { responce in
            switch responce.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let erorr):
                print(erorr.localizedDescription)
            }
        }
    }
    //Xóa thông tin qua phương thức delete
    func deleteFriends(id: Int) {
            AF.request("https://625c2d5cc9e78a8cb9b4cec1.mockapi.io/friends/\(id)", method: .delete, parameters: nil, headers: nil).response { responce in
                switch responce.result {
                case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                        print(json)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let erorr):
                    print(erorr.localizedDescription)
                }
            }
        }
    //Xửa thông tin qua phương thức put
    func putFriend(friend: Friend, id: Int) {
        AF.request("https://625c2d5cc9e78a8cb9b4cec1.mockapi.io/friends/\(id)", method: .put, parameters: friend, encoder: JSONParameterEncoder.default, headers: nil).response { responce in
            switch responce.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let erorr):
                print(erorr.localizedDescription)
            }
        }
    }
    }
