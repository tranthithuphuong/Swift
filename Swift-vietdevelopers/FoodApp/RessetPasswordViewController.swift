//
//  RessetPasswordViewController.swift
//  FoodApp
//
//  Created by chuottp on 15/09/2022.
//

import UIKit

class RessetPasswordViewController: UIViewController {

    @IBOutlet weak var txtRessetPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtRessetPassword.setBorder()
        txtRessetPassword.setPadding(padding: 10)
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
