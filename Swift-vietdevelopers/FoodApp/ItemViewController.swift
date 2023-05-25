//
//  ItemViewController.swift
//  FoodApp
//
//  Created by chuottp on 21/09/2022.
//

import UIKit
var listItem : [Food] = []
class ItemViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cltViewItem.dequeueReusableCell(withReuseIdentifier: "FoodInfoIdetifier", for: indexPath)
        
        let currentFood = listItem[indexPath.item]
        
        let imgFood = cell.viewWithTag(10) as! UIImageView
        imgFood.image = UIImage(named: "\(currentFood.photo)")
        
        let lblName = cell.viewWithTag(11) as! UILabel
        lblName.text! = "\(currentFood.name)"
        
        let lblShipType = cell.viewWithTag(12) as! UILabel
        lblShipType.text! = "\(currentFood.ship)"
        
        let lblTime = cell.viewWithTag(13) as! UILabel
        lblTime.text! = "\(currentFood.time)"
        
        let lblStar = cell.viewWithTag(14) as! UILabel
        lblStar.text! = "\(currentFood.star)"
        
        return cell
    }


    @IBOutlet weak var cltViewItem: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cltViewItem.dataSource = self
        cltViewItem.delegate = self
        initData()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith/1.5-10, height: 212)
        cltViewItem.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        let firstItem = Food(name: "McDonald’s", photo: "image 55", ship: "Free delivery", time: "10-15 mins", star: 4.5)
        listItem.append(firstItem)
        
        let seconItem = Food(name: "Starbuck", photo: "image 10", ship: "Free delivery", time: "10-15 mins", star: 4.7)
        listItem.append(seconItem)
        
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

struct Food {
    var name : String
    var photo : String
    var ship: String
    var time: String
    var star: Float
}
