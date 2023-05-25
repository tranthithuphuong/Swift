//
//  ViewController.swift
//  MultiChoiceItem
//
//  Created by chuottp on 30/09/2022.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblViewPerson: UITableView!
    @IBOutlet weak var ViewCountPersonChoice: UILabel!
    @IBOutlet weak var btnChooseAllPerson: UIButton!
    
    var persons : Person = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewPerson.dataSource = self
        tblViewPerson.delegate = self
        tblViewPerson.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "ViewPersonIdentifier")
        getBooksFromAPI()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewPerson.dequeueReusableCell(withIdentifier: "ViewPersonIdentifier", for: indexPath) as! PersonTableViewCell
        let currentPerson = persons[indexPath.row]
        
        let urlAvatar = URL(string: currentPerson.avatar)
        cell.imgAvatar.kf.setImage(with: urlAvatar)
        
        cell.lblFullName.text! = currentPerson.name
        
        return cell
    }
    
    func getBooksFromAPI() {
        AF.request("https://6332aadda54a0e83d2558ba5.mockapi.io/Person", method: .get) .responseDecodable(of: Person.self) { responseData in
            if let personData = responseData.value {
                self.persons = personData
                self.tblViewPerson.reloadData()
            }
            
        }
    }
    
    
    
}

