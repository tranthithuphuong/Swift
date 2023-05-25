//
//  ViewController.swift
//  ATM_Tech
//
//  Created by chuottp on 19/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnRecharge: UIButton!
    @IBOutlet weak var btnChangePinCode: UIButton!
    @IBOutlet weak var btnTransfer: UIButton!
    @IBOutlet weak var btnWithDraw: UIButton!
    @IBOutlet weak var txtCountMoney: UITextField!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtPinCode: UITextField!
    @IBOutlet weak var txtCardNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    class Person{
//        var id: Int?
//        var name: String = ""
//        var card: String?
//        var pinCode: String?
//        var countMoney: Int?
//    }
//    var persons : [Person] = []
//
//    func addUser(){
//        let phuong = Person()
//        phuong.id = 1
//        phuong.name = "Trần Thị Thu Phương"
//        phuong.card = "0969691630"
//        phuong.pinCode = "09082003"
//        phuong.countMoney = 50000000
//
//        let dang = Person()
//        dang.id = 2
//        dang.name = "Nguyễn Quang Đăng"
//        dang.card = "0396265650"
//        dang.pinCode = "31082003"
//        dang.countMoney = 100000000
//
//        persons.append(phuong)
//        persons.append(dang)
//    }
//
//
//    @IBAction func btnSignIn(_ sender: UIButton) {
//        addUser()
//        if persons.count != 0 {
//            let cardnumber: String = txtCardNumber.text!
//            let pinCode: String = txtPinCode.text!
//            var count: Int = 0
//            for person in persons {
//                if person.card == cardnumber && person.pinCode == pinCode {
//                    lblUserName.text = "Xin chào,  \(person.name)"
//                    lblBalance.text = "Số dư:  \(Int(person.countMoney ?? 50000))"
//                    count += 1
//                    break;
//                }
//            }
//            if count == 0 {
//                lblUserName.text = "Số thẻ không tồn tại"
//                lblBalance.text = ""
//            }
//        }else{
//            lblUserName.text = "Bạn chưa có tài khoản"
//            lblBalance.text = ""
//        }
//    }
//
//    @IBAction func btnWithDraw(_ sender: UIButton) {
//        let card = txtCardNumber.text!
//        let pin = txtPinCode.text!
//        let money: Int = Int(txtCountMoney.text!)!
//        if lblUserName.text != "" {
//            for person in persons {
//                if card == person.card && pin == person.pinCode && money <= person.countMoney ?? 50000 {
//                    person.countMoney = (person.countMoney ?? 50000) - money
//                    lblBalance.text = "Số dư:  \(Int(person.countMoney ?? 50000))"
//                    txtCountMoney.text = ""
//                    break;
//                }
//            }
//        }
//    }
//
//    @IBAction func btnTransfer(_ sender: UIButton) {
//    }
//
//    @IBAction func btnRecharge(_ sender: UIButton) {
//        let card = txtCardNumber.text!
//        let pin = txtPinCode.text!
//        let money: Int = Int(txtCountMoney.text!)!
//        if lblUserName.text != "" {
//            for person in persons {
//                if card == person.card && pin == person.pinCode {
//                    person.countMoney = (person.countMoney ?? 50000) + money
//                    lblBalance.text = "Số dư:  \(Int(person.countMoney ?? 50000))"
//                    txtCountMoney.text = ""
//                    break;
//                }
//            }
//        }
//    }
    
    
    
    
    
    
}


