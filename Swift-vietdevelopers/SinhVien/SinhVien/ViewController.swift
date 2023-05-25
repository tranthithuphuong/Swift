//
//  ViewController.swift
//  SinhVien
//
//  Created by chuottp on 06/09/2022.
//

import UIKit

var studentList : [Student] = []
var studentListSearch : [Student] = []
var scores : [Score] = []
var classes: [Class] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let currentStudent = Student()
    
    @IBOutlet weak var txtSearchName: UITextField!
    
    @IBOutlet weak var btnSearchName: UIButton!
    
    @IBOutlet weak var btnShowStudentTop: UIButton!
    
    @IBOutlet weak var tblStudentList: UITableView!
    
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblStudentList.dataSource = self
        tblStudentList.delegate = self
        initData()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tblStudentList.reloadData()
    }
    func initData() {
        let Phuong = Student()
        Phuong.ID = "1"
        Phuong.name = "Tran Thi Thu Phuong"
        Phuong.classID = "1"
        Phuong.major = "Lập trình mobile"
        studentList.append(Phuong)
                
        let Dang = Student()
        Dang.ID = "2"
        Dang.name = "Nguyen Quang Dang"
        Dang.classID = "2"
        Dang.major = "Thiết kế đồ họa"
        studentList.append(Dang)
                
        let Yen = Student()
        Dang.ID = "5"
        Dang.name = "Phạm Thị Yến"
        Dang.major = "Thiết kế đồ họa"
        studentList.append(Yen)
                
        let WEB3022 = Class()
        WEB3022.ID = "1"
        WEB3022.name = "WEB3022"
        classes.append(WEB3022)
 
        
        let WEB3021 = Class()
        WEB3021.ID = "2"
        WEB3021.name = "WEB3021"
        classes.append(WEB3021)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 189
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentListSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblStudentList.dequeueReusableCell(withIdentifier: "StudentItemIdentifier", for: indexPath)
        
        let lblName = cell.viewWithTag(100) as! UILabel
        let lblClass = cell.viewWithTag(101) as! UILabel
        let lblMajor = cell.viewWithTag(102) as! UILabel
        
        let txtSearchStudent = txtSearchName.text!
        
        if txtSearchStudent != "" {
        
        lblName.text = "\(studentListSearch[indexPath.row].name!)"
        lblClass.text = "\( studentListSearch[indexPath.row].getClassInfor(classID: studentListSearch[indexPath.row].classID)!.name!)"
        lblMajor.text = "\(String(describing: studentListSearch[indexPath.row].major!))"
            
        viewDidAppear(true)
        }
//        lblScoreAVG.text = resultListStudentsSearch[indexPath.row].scoreAVG
        return cell
    }
    
    @IBAction func btnGetInfo(_ sender: Any) {
        let txtSearchStudent = txtSearchName.text!
                
        if txtSearchStudent == "" {
            lblError.text = "Chưa nhập tên"
        } else {
            currentStudent.getStudentInfo(studentName: txtSearchStudent)
        }
    }
}

class Student {
    var ID: String!
    var name: String!
    var classID: String!
    var major: String!
    
    func getStudentInfo(studentName: String) {
        studentListSearch = []
        for student in studentList {
            if(studentName == student.name) {
                studentListSearch.append(student)
            }
        }
    }
    
    func getClassInfor(classID: String) -> Class? {
        for classs in classes {
            if classs.ID == classID {
                return classs;
            }
        }
        return nil
    }
}

class Class {
    var ID: String!
    var name: String!
}

class Score {
    var studentID: String!
    var subject: String!
    var score: Int!
    
//    func getScore(studentID: String) -> Int {
//        for student in studentList {
//            if()
//        }
//    }
}

