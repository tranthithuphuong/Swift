//
//  CostViewController.swift
//  FoodApp
//
//  Created by chuottp on 22/09/2022.
//

import UIKit
var costList : [CostCategoty] = []
class CostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewCost.dequeueReusableCell(withIdentifier: "CostListIdentifier", for: indexPath)
        
        let currentItem = costList[indexPath.row]
        
        let title = cell.viewWithTag(5) as! UILabel
        title.text! = currentItem.title
        
        let lblCost = cell.viewWithTag(6) as! UILabel
        lblCost.text! = "\(currentItem.costSum)"
    
        
        return cell
    }
    

    @IBOutlet weak var tblViewCost: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewCost.dataSource = self
        tblViewCost.delegate = self
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        let subTotal = CostCategoty(title: "Subtotal", costSum: 27.30)
        costList.append(subTotal)
        
        let tax_Fees = CostCategoty(title: "Tax and Fees", costSum: 5.30)
        costList.append(tax_Fees)
        
        let delivery = CostCategoty(title: "Delivery", costSum: 1.00)
        costList.append(delivery)
        
        var result : Float = 0.0
        
        for cost in costList {
            result += cost.costSum
        }
        
        let total = CostCategoty(title: "Total", costSum: result)
        costList.append(total)
        
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
struct CostCategoty {
    var title: String
    var costSum: Float
}
