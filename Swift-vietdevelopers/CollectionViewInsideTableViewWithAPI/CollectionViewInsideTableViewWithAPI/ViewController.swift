//
//  ViewController.swift
//  CollectionViewInsideTableViewWithAPI
//
//  Created by chuottp on 28/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblPerson: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblPerson.delegate = self
        tblPerson.dataSource = self
        tblPerson.register(UINib(nibName: "PersonCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonTableViewCellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblPerson.dequeueReusableCell(withIdentifier: "PersonTableViewCellIdentifier", for: indexPath) as! PersonCategoryTableViewCell
        cell.lblTblPersonName.text = "Danh sách \(indexPath.row)"
        cell.lblTblPersonName.textColor = .yellow
        cell.backgroundColor = .brown
        cell.layer.borderWidth = 1
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }


}

