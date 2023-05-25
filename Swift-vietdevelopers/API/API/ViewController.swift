//
//  ViewController.swift
//  API
//
//  Created by chuottp on 15/11/2022.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var friends : Friend = []
    @IBOutlet weak var tblFriend: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriend.delegate = self
        tblFriend.dataSource = self
        tblFriend.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCellIdentifier")
        getFriendFromAPI()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentFriend = friends[indexPath.row]
        let cell = tblFriend.dequeueReusableCell(withIdentifier: "friendCellIdentifier", for: indexPath) as! FriendTableViewCell
        
        let urlAvatar = URL(string: currentFriend.avatar)
        cell.imgAvatarFriend.kf.setImage(with: urlAvatar)
        
        cell.lblNameFriend.text = currentFriend.name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func getFriendFromAPI() {
        AF.request("https://632c7f3e1aabd837399d7b69.mockapi.io/friend", method: .get).responseDecodable(of: Friend.self) {
            responseData in
            if let friendData = responseData.value {
                self.friends = friendData
                self.tblFriend.reloadData()
            }
        }
    }


}

