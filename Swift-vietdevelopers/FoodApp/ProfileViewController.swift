//
//  ProfileViewController.swift
//  FoodApp
//
//  Created by chuottp on 16/09/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var txtfullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfullName.setBorder()
        txtfullName.setPadding(padding: 10)
        txtEmail.setBorder()
        txtEmail.setPadding(padding: 10)
        txtPhoneNumber.setBorder()
        txtPhoneNumber.setPadding(padding: 10)
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
