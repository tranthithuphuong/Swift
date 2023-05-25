//
//  FoodDetailViewController.swift
//  FoodApp
//
//  Created by chuottp on 16/09/2022.
//

import UIKit
var items : [Item] = []
class FoodDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblItemAddList.dequeueReusableCell(withIdentifier: "AddItemIdentifier", for: indexPath)
        
        let currentItem = items[indexPath.row]
        
        let imgPhoto = cell.viewWithTag(1) as! UIImageView
        imgPhoto.image = UIImage(named: "\(currentItem.photo)")
        
        let lblName = cell.viewWithTag(2) as! UILabel
        lblName.text! = currentItem.name
        
        let lblPrice = cell.viewWithTag(3) as! UILabel
        lblPrice.text! = "+$\(currentItem.price)"
        
        return cell
    }

    @IBOutlet weak var tblItemAddList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblItemAddList.dataSource = self
        tblItemAddList.dataSource = self
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        let firstItem = Item(photo: "pepper", name: "Pepper  Julienned", price: 2.30)
        items.append(firstItem)
        
        let seconItem = Item(photo: "Baby", name: "Baby Spinach", price: 4.70)
        items.append(seconItem)
        
        let thirdItem = Item(photo: "Masroom", name: "Masroom", price: 2.50)
        items.append(thirdItem)
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
struct Item {
    var photo : String
    var name: String
    var price : Float
}
