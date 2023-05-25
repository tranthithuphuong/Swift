//
//  ViewController.swift
//  LuyenTapAPI
//
//  Created by chuottp on 23/09/2022.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var animals : Animal = []
    var likeDictionary : [Int : Bool] = [:]
    
    @IBOutlet weak var tblAnimals: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblAnimals.dataSource = self
        tblAnimals.delegate = self
        tblAnimals.register(UINib(nibName: "AnimalsCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "animalCellIdentifier")
        getAnimalFromAPI()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentAnimal = animals[indexPath.row]
        let cell = tblAnimals.dequeueReusableCell(withIdentifier: "animalCellIdentifier", for: indexPath) as! AnimalsCategoryTableViewCell
        
        let avartaURL = URL(string: currentAnimal.avatar)
        cell.imgAnimalAvatar.kf.setImage(with: avartaURL)
        
        //cell.lblAnimalName.text = "Nhoms \(indexPath.row)"
        cell.lblAnimalName.text = currentAnimal.name
//        cell.lblAnimalName.textColor = .yellow
//        cell.backgroundColor = .brown
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        
//        let likeButton = UIButton()
//        likeButton.frame = CGRect(x: 50, y: 40, width: 50, height: 50)
//        likeButton.backgroundColor = .blue
//        likeButton.setTitle("Like", for: .normal)
//        likeButton.tag = indexPath.row
//        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
//        cell.addSubview(likeButton)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeAction(_:)), for: .touchUpInside)
        
        if let isButtonLiked = likeDictionary[indexPath.row] {
            if isButtonLiked {
            cell.likeButton.setImage(UIImage(named: "liked"), for: .normal)
            }
        }
        
        return cell
        
        
    }
    
    @objc func likeAction(_ sender: UIButton) {
        if let isButtonLiked = likeDictionary[sender.tag] {
            likeDictionary[sender.tag] = !isButtonLiked
        }else{
            likeDictionary[sender.tag] = true
        }
        tblAnimals.reloadData()
        
//        let currentAnimal = animals[sender.tag]
//        print("Like button clicked on cell \(sender.tag)")
        }
    
    func getAnimalFromAPI(){
        AF.request("https://632c7f3e1aabd837399d7b69.mockapi.io/animals", method: .get).responseDecodable(of: Animal.self) {
            responseData in
            if let animalData = responseData.value {
                self.animals = animalData
                self.tblAnimals.reloadData()
            }
        }
    }

}

