//
//  RatingViewController.swift
//  FoodApp
//
//  Created by chuottp on 22/09/2022.
//

import UIKit
extension UIView {
    func setViewBorder() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10
    }
}
class RatingViewController: UIViewController {

    @IBOutlet weak var viewReview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewReview.setViewBorder()
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
