//
//  ThirdScenceViewController.swift
//  CorrectQLSV
//
//  Created by chuottp on 13/09/2022.
//

import UIKit

class ThirdScenceViewController: UIViewController {

    
    @IBOutlet weak var btnGotoDOfScenceC: UIButton!
    @IBOutlet weak var btnBackAaofScenceC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoToDOfScenceC(_ sender: UIButton) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "FourthScenceViewController") as! FourthScenceViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func BackAOfScenceC(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
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
