//
//  ViewController.swift
//  VNCERT_CC
//
//  Created by chuottp on 07/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logOut(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"Home")
        vc .modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
    }
    
}

