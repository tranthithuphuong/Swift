//
//  SignUp_InViewController.swift
//  FoodApp
//
//  Created by chuottp on 15/09/2022.
//

import UIKit
extension UITextField{
    func setPadding(padding: Int) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: Int(self.frame.height)))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setBorder(){
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10
    }
}
class SignUp_InViewController: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtLoginEmail: UITextField!
    @IBOutlet weak var txtLoginPassWord: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFullName?.setBorder()
        txtFullName?.setPadding(padding: 10)
        txtEmail?.setBorder()
        txtEmail?.setPadding(padding:10)
        txtPassword?.setBorder()
        txtPassword?.setPadding(padding: 10)
        txtLoginEmail?.setPadding(padding: 10)
        txtLoginEmail?.setBorder()
        txtLoginPassWord?.setBorder()
        txtLoginPassWord?.setPadding(padding: 10)      // Do any additional setup after loading the view.
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
