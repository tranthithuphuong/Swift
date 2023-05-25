//
//  PersonCategoryTableViewCell.swift
//  CollectionViewInsideTableViewWithAPI
//
//  Created by chuottp on 28/09/2022.
//

import UIKit
import Kingfisher
import Alamofire

class PersonCategoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var person : Persons = []

    @IBOutlet weak var cltPerson: UICollectionView!
    @IBOutlet weak var lblTblPersonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cltPerson.delegate = self
        cltPerson.dataSource = self
        cltPerson.register(UINib(nibName: "PersonCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PersonCollectionViewCellIdentifier")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        cltPerson.collectionViewLayout = layout
        getPersonFromAPI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return person.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentPerson = person[indexPath.row]
        let cell = cltPerson.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCellIdentifier", for: indexPath) as! PersonCategoryCollectionViewCell
        cell.lblCltPersonName.text = currentPerson.name
        cell.backgroundColor = .purple
        cell.layer.borderWidth = 0.5
        
        let urlImg = URL(string: currentPerson.avatar)
        cell.imgPersonAvatar.kf.setImage(with: urlImg)
        
        return cell
    }
    
    func getPersonFromAPI() {
        AF.request("https://632c7f3e1aabd837399d7b69.mockapi.io/friends", method: .get).responseDecodable(of: Persons.self)  { responseData in
            if let personData = responseData.value {
                self.person = personData
                self.cltPerson.reloadData()
            }
        }
    }
}

