//
//  ViewController.swift
//  MayTinhCuaToi
//
//  Created by chuottp on 17/08/2022.
//

import UIKit

class ViewController: UIViewController {
    var count : Int = 0 

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var btnIncrease: UIButton!
    @IBOutlet weak var btnDecrease: UIButton!
    @IBOutlet weak var lblCountNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCountNumber.text = String(count)
        // Do any additional setup after loading the view.
    }


    @IBAction func btnDecreasePressed(_ sender: UIButton) {
        if(count > 0) {
            count -= 1
            lblCountNumber.text = String(count)
        }
    }
    
    @IBAction func btnIncreasePressed(_ sender: UIButton) {
        
        //btnIncrease.backgroundColor = .blue
        //btnIncrease.setTitle("Chuột", for: .normal)
        if  let inputNumber : Int = Int(txtInput.text!) {
            count += inputNumber
            lblCountNumber.text = String(count)
        }else{
            lblMessage.text = "Don't write text here"
        }
        
    }
}

