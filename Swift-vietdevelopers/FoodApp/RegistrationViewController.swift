//
//  RegistrationViewController.swift
//  FoodApp
//
//  Created by chuottp on 15/09/2022.
//

import UIKit

class RegistrationViewController: UIViewController {


    @IBOutlet weak var txtRegistration: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtRegistration.setBorder()
        txtRegistration.setPadding(padding: 13)
        // Do any additional setup after loading the view.
        let phoneNumberImage = UIImage(named: "country")
        addImageLeft(text: txtRegistration!, andImage: phoneNumberImage!)
    }
    
    func addImageLeft(text: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: -20.0, width: img.size.width, height: img.size.height+5))
        leftImageView.image = img
        text.leftView = leftImageView
        text.leftViewMode = .always
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
