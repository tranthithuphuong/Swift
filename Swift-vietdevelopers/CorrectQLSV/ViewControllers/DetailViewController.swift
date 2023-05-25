//
//  DetailViewController.swift
//  CorrectQLSV
//
//  Created by chuottp on 13/09/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var btnGotoCOfScenceB: UIButton!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
   
    @IBOutlet weak var lblEmail: UILabel!
    var currentStudent: Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = currentStudent?.name
        lblEmail.text = currentStudent?.email
        lblPhoneNumber.text = currentStudent?.phoneNumber
        self.navigationItem.title = "Màn hình B"
        let rightBarButton = UIBarButtonItem(title: "+", image: nil, primaryAction: nil, menu: nil)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let leftBarButton = UIBarButtonItem(title: "< Return", style: .done, target: self, action: #selector(barButtonAction))
        self.navigationItem.leftBarButtonItem = leftBarButton

        // Do any additional setup after loading the view.
    }
    
   @objc func barButtonAction() {
       self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func GoToCOfScenceB(_ sender: UIButton) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdScenceViewController") as! ThirdScenceViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
        
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
