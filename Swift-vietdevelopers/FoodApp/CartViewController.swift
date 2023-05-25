//
//  CartViewController.swift
//  FoodApp
//
//  Created by chuottp on 16/09/2022.
//

import UIKit
var itemList : [CartItem] = []

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewItemAddCart.dequeueReusableCell(withIdentifier: "ItemAddCartView", for: indexPath)
        
        let currentItem = itemList[indexPath.row]
        
        let imgPhoto = cell.viewWithTag(1) as! UIImageView
        imgPhoto.image = UIImage(named: "\(currentItem.photo)")
        
        let lblTitle = cell.viewWithTag(2) as! UILabel
        lblTitle.text! = currentItem.title
        
        let lnlDescription = cell.viewWithTag(3) as! UILabel
        lnlDescription.text! = currentItem.description
        
        let lblPrice = cell.viewWithTag(4) as! UILabel
        lblPrice.text! = "$\(currentItem.price)"
        
        return cell
    }
    

    @IBOutlet weak var tblViewItemAddCart: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewItemAddCart.dataSource = self
        tblViewItemAddCart.delegate = self
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        let firstItem = CartItem(photo: "Chicken Pizza", title: "Red n hot pizza", description: "Spicy chicken, beef", price: 15.30)
        itemList.append(firstItem)
        let seconItem = CartItem(photo: "Fruit Pizza", title: "Greek salad ", description: "with baked salmon", price: 12.00)
        itemList.append(seconItem)
        
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct CartItem {
    var photo: String
    var title : String
    var description: String
    var price: Float
}


