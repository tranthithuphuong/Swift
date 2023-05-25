//
//  FriendTableViewCell.swift
//  APITableCollection
//
//  Created by Dương Văn Cường on 27/09/2022.
//

import UIKit
import Alamofire
import Kingfisher

class FriendTableViewCell: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource {
    
    var friends: Friends = []

    @IBOutlet weak var lblGroupName: UILabel!
    
    @IBOutlet weak var clvFriends: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        clvFriends.delegate = self
        clvFriends.dataSource = self
        clvFriends.register(UINib(nibName: "FriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FriendCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        clvFriends.collectionViewLayout = layout
        
        getFriendsFromAPI()
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvFriends.dequeueReusableCell(withReuseIdentifier: "FriendCollectionViewCell", for: indexPath) as! FriendCollectionViewCell
        
        var currentFriend = friends[indexPath.row]
        cell.lblFriendname.text = currentFriend.name
        
//        cell.backgroundColor = .blue
        let img = URL(string: currentFriend.avatar)
        cell.imgFriend.kf.setImage(with: img)
        
        return cell
    }
    
    
    func getFriendsFromAPI(){
        AF.request("https://625c2d5cc9e78a8cb9b4cec1.mockapi.io/friends", method: .get).responseDecodable(of: Friends.self) {
            responsedata in
//            debugPrint(responsedata)
            if let friendsData = responsedata.value{
                self.friends = friendsData
                self.clvFriends.reloadData()
            }
        }
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
