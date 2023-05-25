//
//  MainViewController.swift
//  BEPVIET
//
//  Created by chuottp on 02/09/2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblListFood: UITableView!
    
    var foodList : [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblListFood.dataSource = self
        tblListFood.delegate = self
        initLoaded()
    }
    
    func initLoaded() {
        let firstFood = Food(name: "Canh chua", category: "Chua", difficuties: "Dễ", time: 20, peoples: 10, photo: "2-canhchua")
        foodList.append(firstFood)
        
        let seconFood = Food(name: "Sườn xào", category: "Chua", difficuties: "Trung bình", time: 10, peoples: 12, photo: "_1-suonxao")
        foodList.append(seconFood)
        
        let thirdFood = Food(name: "Rau muống", category: "Bổ dưỡng", difficuties: "Dễ", time: 20, peoples: 10, photo: "3-raumuong")
        foodList.append(thirdFood)
        
        let fourthFood = Food(name: "Đậu sốt", category: "Chua", difficuties: "Trung bình", time: 30, peoples: 15, photo: "4-dausot")
        foodList.append(fourthFood)
        
        let fifthFood = Food(name: "Bò BeefSteak", category: "Dầu mỡ", difficuties: "Khó", time: 30, peoples: 9, photo: "5-bobeefsteak")
        foodList.append(fifthFood)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 336
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFoodItem", for: indexPath)
        
        let currentFood = foodList[indexPath.row]
        
        let lblFoodImage = cell.viewWithTag(100) as! UIImageView
        lblFoodImage.image! = UIImage(named: currentFood.photo)!
        
        let lblFoodCate = cell.viewWithTag(101) as! UILabel
        lblFoodCate.text! = currentFood.category!
        
        let lblFoodTitle = cell.viewWithTag(102) as! UILabel
        lblFoodTitle.text! = currentFood.name!
        
        let lblFoodTime = cell.viewWithTag(103) as! UILabel
        lblFoodTime.text! = "\(currentFood.time!) phút"
        
        let lblFoodDifficuties = cell.viewWithTag(104) as! UILabel
        lblFoodDifficuties.text! = currentFood.difficuties!
        
        let lblFoodPeoples = cell.viewWithTag(105) as! UILabel
        lblFoodPeoples.text! = "\(currentFood.peoples!) người"
        
        return cell
    }
    
}


struct Food {
    var name : String!
    var category : String!
    var difficuties : String!
    var time : Int!
    var peoples : Int!
    var photo : String!
}
