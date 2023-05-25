//
//  MenuViewController.swift
//  FoodApp
//
//  Created by chuottp on 16/09/2022.
//

import UIKit

var foods : [FastFood] = []

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cltFoodView.dequeueReusableCell(withReuseIdentifier: "FoodItemIdentifier", for: indexPath)
        
        let currentFood = foods[indexPath.item]
        
        let imgFood = cell.viewWithTag(1) as! UIImageView
        imgFood.image = UIImage(named: "\(currentFood.photo)")
        
        let lblName = cell.viewWithTag(2) as! UILabel
        lblName.text! = "\(currentFood.name)"
        
        
        
        return cell
    }
    @IBOutlet weak var cltFoodView: UICollectionView!

    @IBOutlet weak var txtFind: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad();
        cltFoodView.dataSource = self
        cltFoodView.delegate = self
        txtFind.setBorder()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith/4-10, height: 172)
        cltFoodView.collectionViewLayout = layout
        initData()
        
    }
    
    func initData() {
        let firstFood = FastFood(name: "Burger", photo: "Hambergur")
        foods.append(firstFood)
        
        let seconFood = FastFood(name: "Donut", photo: "DonutCake")
        foods.append(seconFood)
        
        let thirdFood = FastFood(name: "Pizza", photo: "Pizza")
        foods.append(thirdFood)
        
        let fourthFood = FastFood(name: "Mexica", photo: "HotDog")
        foods.append(fourthFood)
        
        let fifthFood = FastFood(name: "Asian", photo: "Cheese")
        foods.append(fifthFood)
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

struct FastFood {
    var name : String
    var photo : String
}
