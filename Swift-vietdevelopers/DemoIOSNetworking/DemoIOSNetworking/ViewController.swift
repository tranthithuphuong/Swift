//
//  ViewController.swift
//  DemoIOSNetworking
//
//  Created by chuottp on 22/09/2022.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblFriends: UITableView!
    var friends : Friends = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriends.dataSource = self
        tblFriends.delegate = self
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCellIdentifier")
        getFriendsFromAPI()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let currentFriend = friends[indexPath.row]
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "friendCellIdentifier", for: indexPath) as! FriendTableViewCell
        
//cach 1:
//        let avatarURL = URL(string: currentFriend.avatar)
//        let avatarData = try? Data(contentsOf: avatarURL!)
//
//        cell.imgFriendAvatar.image = UIImage(data: avatarData!)

//cach 2:
        let avatarURL = URL(string: currentFriend.avatar)
        cell.imgFriendAvatar.kf.setImage(with: avatarURL)
        
        
        cell.lblFriendName.text = currentFriend.name
        cell.lblFriendName.textColor = .yellow
        cell.layer.borderWidth = 1
        cell.backgroundColor = .brown
        return cell
        
    }
    func getFriendsFromAPI() {
//        AF.request("https://632c7f3e1aabd837399d7b69.mockapi.io/friends", method: .get).response{
//            responseData in
//            debugPrint(responseData)
//        }
        AF.request("https://632c7f3e1aabd837399d7b69.mockapi.io/friends", method: .get).responseDecodable(of: Friends.self) { respondData in
            if let friendsData = respondData.value {
                self.friends = friendsData
                self.tblFriends.reloadData()
            }
            
        }
    }

}

