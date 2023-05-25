//
//  ViewController.swift
//  APITableCollection
//
//  Created by Dương Văn Cường on 27/09/2022.
//

import UIKit
import Alamofire
import Kingfisher



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    var friends: Friends = []

    @IBOutlet weak var tblFriends: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblFriends.dataSource = self
        tblFriends.delegate = self
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
        
//        getFriendsFromAPI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        
        cell.lblGroupName.text = "Nhóm \(indexPath.row)"
        return cell
    }

    
    
    
//    func getFriendsFromAPI(){
//        AF.request("https://625c2d5cc9e78a8cb9b4cec1.mockapi.io/friends", method: .get).responseDecodable(of: Friends.self) {
//            responsedata in
////            debugPrint(responsedata)
//            if let friendsData = responsedata.value{
//                self.friends = friendsData
//                self.tblFriends.reloadData()
//            }
//        }
//    }
}

