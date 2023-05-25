//
//  SideMenuViewController.swift
//  FoodApp
//
//  Created by chuottp on 22/09/2022.
//

import UIKit
var optionList : [Option] = []
class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewOption.dequeueReusableCell(withIdentifier: "OptionViewIdentifier", for: indexPath)
        
        let currentOption = optionList[indexPath.item]
        
        let imgFood = cell.viewWithTag(1) as! UIImageView
        imgFood.image = UIImage(named: "\(currentOption.photo)")
        
        let lblName = cell.viewWithTag(2) as! UILabel
        lblName.text! = "\(currentOption.title)"
        
        return cell
    }
    

    @IBOutlet weak var tblViewOption: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewOption.dataSource = self
        tblViewOption.delegate = self
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        let firstOption = Option(photo: "Document", title: "My Orders")
        optionList.append(firstOption)
        
        
        let thirdOption = Option(photo: "Profile", title: "My Profile")
        optionList.append(thirdOption)
        
        let fourthOption = Option(photo: "Location", title: "Delivery Address")
        optionList.append(fourthOption)
        
        let fiftOption = Option(photo: "Wallet", title: "Payment Methods")
        optionList.append(fiftOption)
        
        let sixOption = Option(photo: "Message", title: "Contact Us")
        optionList.append(sixOption)
        
        let sevenOption = Option(photo: "Setting", title: "Settings")
        optionList.append(sevenOption)
        
        
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
struct Option {
    var photo: String
    var title: String
}
