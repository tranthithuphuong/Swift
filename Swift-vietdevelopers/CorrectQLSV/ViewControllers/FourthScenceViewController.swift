//
//  FourthScenceViewController.swift
//  CorrectQLSV
//
//  Created by chuottp on 13/09/2022.
//

import UIKit

class FourthScenceViewController: UIViewController {

    @IBOutlet weak var btnBackBOfScenceD: UIButton!
    @IBOutlet weak var btnBackAOfScenceD: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackAOfScenceD(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func BackBOfScenceD(_ sender: UIButton) {
        
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
