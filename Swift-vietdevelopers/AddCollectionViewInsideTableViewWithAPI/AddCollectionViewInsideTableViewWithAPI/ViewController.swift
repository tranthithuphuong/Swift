//
//  ViewController.swift
//  AddCollectionViewInsideTableViewWithAPI
//
//  Created by chuottp on 28/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblBookCategory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblBookCategory.delegate = self
        tblBookCategory.dataSource = self
        tblBookCategory.register(UINib(nibName: "BookCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCellIdentifier")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblBookCategory.dequeueReusableCell(withIdentifier: "BookTableViewCellIdentifier", for: indexPath) as! BookCategoryTableViewCell
        cell.lblGroupBookName.text = "Thể loại sách \(indexPath.row)"
        cell.lblGroupBookName.textColor = .yellow
        cell.backgroundColor = .brown
        cell.layer.borderWidth = 1
        
//        let likeButton = UIButton(frame: CGRect(x: 50, y: 70, width: 50, height: 50))
//        let likeButton = UIButton()
//        likeButton.frame = CGRect(x: 50, y: 80, width: 50, height: 50)
//        likeButton.backgroundColor = .blue
//        likeButton.setTitle("Like", for: .normal)
//        likeButton.tag = indexPath.row
//        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
//        cell.addSubview(likeButton)
        
        return cell
    }
    
//    @objc func likeAction(_ sender: UIButton) {
//        let currentBook = 
//        print("Like button clicked on cell \(sender.tag)")
//        }


}

