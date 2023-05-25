//
//  ViewController.swift
//  DemoAPINetworkingWithAlamofire
//
//  Created by blackhat on 22/09/2022.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblErorr: UILabel!
    @IBOutlet weak var txtAvatar: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var btnAddNewPerson: UIButton!
    @IBOutlet weak var tblFriends: UITableView!
    
    @IBOutlet weak var btnReload: UIButton!
    var friendsData: Friends = []
    //Buoc 1
    var likeDictionary: [Int:Bool] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriends.delegate = self
        tblFriends.dataSource = self
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCellIdentifier")
        getSaveData()
        if friendsData.isEmpty {
            getFriendsFromAPI()
            print("Gọi API")
            saveData()
            
        } else {
            
            print("dữ liệu đã tồn tại")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "friendCellIdentifier", for: indexPath) as! FriendTableViewCell
        
        let currentFriend = friendsData[indexPath.row]
        let url = URL(string: currentFriend.avatar)
        cell.imgFriendAvatar.kf.setImage(with: url)
        
        cell.lblFriendName.text = currentFriend.name
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeAction(_:)), for: .touchUpInside)
        
        cell.btnDeletePerson.tag = Int(currentFriend.id)! * 100
        cell.btnDeletePerson.addTarget(self, action: #selector(deletePerson(_:)), for: .touchUpInside)
        
        cell.btnChangeInfo.tag = Int(currentFriend.id)! * 1000
        cell.btnChangeInfo.addTarget(self, action: #selector(putInfo(_:)), for: .touchUpInside)
        
        //Buoc 3
        if let isButtonLiked = likeDictionary[indexPath.row] {
            if isButtonLiked {
                cell.likeButton.setImage(UIImage(named: "liked"), for: .normal)
            }
        }
        cell.indexPath = indexPath
        return cell
    }
    
    //Buoc 2
    @objc func likeAction(_ sender: UIButton) {
        if let isButtonLiked = likeDictionary[sender.tag] {
            likeDictionary[sender.tag] = !isButtonLiked
        } else {
            likeDictionary[sender.tag] = true
        }
        tblFriends.reloadData()
    }
    
    //Xóa user
    @objc func deletePerson(_ sender: UIButton) {
        let id:Int = sender.tag / 100
        
        //Gọi đến hàm deleteFriend bên APIHandle
        APIHandler.init().deleteFriends(id: id)
        getFriendsFromAPI()
        self.tblFriends.reloadData()
    }
    
    
    // sửa thông tin
    @objc func putInfo(_ sender: UIButton) {
        let id:Int = sender.tag / 1000
        if(txtUserName.text != "" && txtAvatar.text != "") {
            putData(id: id, creatAt: "2022-09-28T00:55:28.152Z")
        } else {
            lblErorr.text = "Dữ liệu chưa được nhập đủ!"
        }
        
    }
    
    @IBAction func reloadData(_ sender: UIButton) {
        getFriendsFromAPI()
        self.tblFriends.reloadData()
    }
    

    
    func getFriendsFromAPI() {
        APIHandler.init().getFriends { friendsResponseData in
            self.friendsData = friendsResponseData
            self.tblFriends.reloadData()
        }
    }
    
    //Hàm lấy dữ liệu user đã được lưu vào UserDefault
    func getSaveData() {
        if !self.friendsData.isEmpty
        {
           let data = UserDefaults.standard.data(forKey: "saveData") //tạo userDefault
            let saveData = try? JSONDecoder().decode(Friends.self, from: data!) //truyển dữ liệu trong userdefault từ chuỗi JSON sang ký tự code
            self.friendsData = saveData! //gắn dữ liệu mới lấy vào mảng
           print("đã lưu")
            viewDidLoad()
       }
        else {
            self.friendsData = []
        }
        
    }
    
    // Hàm lưu thông tin các user vào trong UserDefault sau khi gọi API
    func saveData() {
        UserDefaults.standard.set(try? JSONEncoder().encode(self.friendsData), forKey: "saveData")
    }
    
    //Hàm xử lý xửa thông tin user qua phương thức put
    func putData(id: Int, creatAt: String) {
        let changeFriend = Friend(
            createdAt: "\(creatAt)",
            name: "\(txtUserName.text!)",
            avatar: "\(txtAvatar.text!)",
            id: "\(id)"
            )
        
        print(changeFriend)
        txtAvatar.text = ""
        txtUserName.text = ""
        
        //Gọi hàm Xửa bên APIHandle và truyền dữ liệu mới để xửa thông tin user
        APIHandler.init().putFriend(friend: changeFriend, id: id)
        getFriendsFromAPI()
        self.tblFriends.reloadData()
    }
    
    
    // hàm xử lý thêm user qua phương thức post
    func addData(name:String, avatar:String) {
        let friend = Friend(createdAt: "2022-09-28T00:55:28.152Z",
        name: "\(name)",
        avatar: "\(avatar)",
        id: "50")
        
        //Gọi hàm postFriends bên APIHandle và truyền dữ liệu để thêm user
        APIHandler.init().postFriends(friend: friend)
        
        //gọi lại API và reload bảng
        getFriendsFromAPI()
        self.tblFriends.reloadData()
    }
    
    
    // thêm user
    @IBAction func btnAddNew(_ sender: UIButton) {
        let name = txtUserName.text!
        let avatar = txtAvatar.text!
        
        if( name != "" && avatar != "" ) {
            // Gọi hàm xử lý thêm user
            addData(name: name, avatar: avatar)
            txtAvatar.text=""
            txtUserName.text=""
        } else {
            lblErorr.text = "Dữ liệu chưa được nhập đủ!!"
        }
    }
    
}

