//
//  CategoryViewController.swift
//  FoodApp
//
//  Created by chuottp on 16/09/2022.
//

import UIKit
var categories : [Category] = []


class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 283
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewCategoryFood.dequeueReusableCell(withIdentifier: "ItemFoodViewCell", for: indexPath)
        
        let currentCategory = categories[indexPath.row]
        
        let imgPhoto = cell.viewWithTag(1) as! UIImageView
        imgPhoto.image = UIImage(named: "\(currentCategory.photo)")
        
        let lblTitle = cell.viewWithTag(2) as! UILabel
        lblTitle.text! = currentCategory.title
        
        let lblDesciption = cell.viewWithTag(3) as! UILabel
        lblDesciption.text! = currentCategory.description
        
        let lblPrice = cell.viewWithTag(4) as! UILabel
        lblPrice.text! = "\(currentCategory.price)"
        
        let lblVoteStar = cell.viewWithTag(5) as! UILabel
        lblVoteStar.text! = "\(currentCategory.voteStar)"
        
        return cell
    }
    

    @IBOutlet weak var tblViewCategoryFood: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewCategoryFood.dataSource = self
        tblViewCategoryFood.delegate = self
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        let firstCate = Category(photo: "Chicken Pizza", title: "Chicken Hawaiian", description: "Chicken, Cheese and pineapple", price: 10.35, voteStar: 4.5)
        categories.append(firstCate)
        
        let seconCate = Category(photo: "Fruit Pizza", title: "Chicken Hawaiian", description: "Chicken, Cheese and pineapple", price: 10.35, voteStar: 4.5)
        categories.append(seconCate)
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

struct Category {
    var photo: String
    var title: String
    var description: String
    var price: Float
    var voteStar: Float
}
