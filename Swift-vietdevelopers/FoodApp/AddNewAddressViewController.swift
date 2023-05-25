//
//  AddNewAddressViewController.swift
//  FoodApp
//
//  Created by chuottp on 16/09/2022.
//

import UIKit

class AddNewAddressViewController: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCity.setBorder()
        txtCity.setPadding(padding: 10)
        txtState.setBorder()
        txtState.setPadding(padding: 10)
        txtStreet.setBorder()
        txtStreet.setPadding(padding: 10)
        txtFullName.setBorder()
        txtFullName.setPadding(padding: 10)
        txtMobileNumber.setBorder()
        txtMobileNumber.setPadding(padding: 10)
        // Do any additional setup after loading the view.
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
