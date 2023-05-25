//
//  ViewController.swift
//  SinhVienApp
//
//  Created by chuottp on 23/08/2022.
//

import UIKit

var students: [String: Person] = [:]
var classes: [String: Class] = [:]
var majors: [Major] = []
var departments: [Department] = []
var subjects: [Subject] = []
var scores: [Score] = []

class ViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassWord: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var lblStudent: UILabel!
    
    @IBOutlet weak var txtStudentId: UITextField!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var lblNameSearch: UILabel!
    
    @IBOutlet weak var lblClassSearch: UILabel!
    
    @IBOutlet weak var txtClassId: UITextField!
    
    @IBOutlet weak var btnFind: UIButton!
    
    @IBOutlet weak var lblClassFind: UILabel!
    
    @IBOutlet weak var lblNameFind: UILabel!
    
    @IBOutlet weak var lblTotalScore: UILabel!
    
    @IBOutlet weak var lblThePoint: UILabel!
    
    @IBOutlet weak var lblErrorSearch: UILabel!
    
    @IBOutlet weak var lblErrorFind: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initData()
    }

    var currentClass = Class()
    var currentScore = Score()
    
    @IBAction func btnTapLogin(_ sender: UIButton) {
        let info = currentClass.logIn(studentName: txtUserName.text!, studentID: txtPassWord.text!)!
        
        lblStudent.text! = "\(currentClass.getStudentInfo(studentID: info.ID!)!.name!)"
    }
    
    @IBAction func btnTapSearchStudent(_ sender: UIButton) {
        let std = currentClass.isStudentExsit(studentID: txtStudentId.text!)
        if std {
            lblNameSearch.text! = "\(currentClass.getStudentInfo(studentID: txtStudentId.text!)!.name!)"
            lblClassSearch.text! = "\(currentClass.getClassInfo(studentID: txtStudentId.text!)!.classID!)"
            lblErrorSearch.text! = " "
        } else {
            lblErrorSearch.text! = "Không tìm thấy thông tin phù hợp"
            lblNameSearch.text! = " "
            lblClassSearch.text! = " "
        }
    }
    
    @IBAction func btnTapFindStudent(_ sender: Any) {
        
    }
    
    func initData() {
        let Nam = Gender()
        Nam.sex = "Nam"
        let Nu = Gender()
        Nu.sex = "Nữ"
        
        let teacherChuong = Person()
        teacherChuong.ID = "12345"
        teacherChuong.name = "Nguyễn Khả Chương"
        teacherChuong.email = "Boss@gmail.com"
        teacherChuong.gender = Nam
        teacherChuong.isStudent = false
        
        let phuong = Person()
        phuong.ID = "28706"
        phuong.name = "Trần Thị Thu Phương"
        phuong.email = "phuongtttph28706@fpt.edu.vn"
        phuong.gender = Nu
        phuong.isStudent = true
        
        students["28706"] = phuong
        
        let dang = Person()
        dang.ID = "28064"
        dang.name = "Nguyễn Quang Đăng"
        dang.email = "dangnqph28064@fpt.edu.vn"
        dang.gender = Nam
        dang.isStudent = true
        
        students["28064"] = dang
        
        let clsWeb = Class()
        clsWeb.classID = "WEB17330"
        clsWeb.teacherID = "12345"
        clsWeb.addStudent(studentID: "28064", student: dang)
        clsWeb.majorID = "1"
        
        classes["WEB17330"] = clsWeb
        
        let clsMobile = Class()
        clsWeb.classID = "CP17314"
        clsWeb.teacherID = "54321"
        clsWeb.addStudent(studentID: "28706", student: phuong)
        clsWeb.majorID = "2"
        
        classes["CP17314"] = clsMobile
        
        let htmlCSS = Subject()
        htmlCSS.ID = "1"
        htmlCSS.majorID = "1"
        htmlCSS.name = "Thiết Kế Web"
        
        let javaScript = Subject()
        htmlCSS.ID = "2"
        htmlCSS.majorID = "1"
        htmlCSS.name = "JavaScipt"
        
        let scoreHTMLCSS = Score()
        scoreHTMLCSS.ID = "final"
        scoreHTMLCSS.score = 10
        scoreHTMLCSS.date = "12/5/2022"
        scoreHTMLCSS.studentID = "28706"
        scoreHTMLCSS.subject = htmlCSS
        
        scores.append(scoreHTMLCSS)
        
        let scoreJS = Score()
        scoreHTMLCSS.ID = "final2"
        scoreHTMLCSS.score = 7
        scoreHTMLCSS.date = "12/5/2022"
        scoreHTMLCSS.studentID = "28064"
        scoreHTMLCSS.subject = javaScript
        
        scores.append(scoreJS)
    }
}
var currentScore = Score()

class Gender{
    var sex: String?
}


class Person{
    var ID: String?
    var name: String?
    var email: String?
    var gender: Gender?
    var isStudent: Bool?
    
 //   func updateInformation(personID: String) -> Bool {}
    
  //  func getClass(teacherID: String, majorID: Major) -> Bool {

   // }

    
}



class Class{
    var classID: String?
    var teacherID: String?
    var student: [String: Person] = [:]
    var majorID: String?
    
    func isStudentExsit(studentID: String) -> Bool {
        for (key,_) in students {
            if studentID == key {
                return true
            }
        }
        return false
      }
    
    func logIn(studentName: String, studentID: String) -> Person? {
        let error = Person()
        for student in students {
            if student.value.name == studentName {
                if student.value.ID == studentID {
                    return student.value
                } else {
                    error.ID = "3"
                    error.name = "sai mật khẩu"
                    students["error"] = error
                    return error
                }
            }
        }

        error.ID = "4"
        error.name = "Không có tài khoản này"
        students["error"] = error
        return error
    }
      
    func addStudent(studentID: String, student: Person) {
        self.student["\(studentID)"] = student
    }
    
    func getStudentInfo(studentID: String) -> Person? {
        for student in students {
            if student.value.ID == studentID {
                return student.value
            }
        }
        return nil
    }
    
    func getClassInfo(studentID: String) -> Class? {
        for classe in classes {
            for std in classe.value.student {
                if studentID == std.value.ID {
                    return classe.value
                }
            }
        }
        return nil
    }
    
//    func getStudentHighScore(classID: String) {
//        var averageScore[String: Int] = [:]
//        for classe in classes {
//            if classe.value.classID == classID {
//                for std in classe.value.student {
//                    let highScore = currentScore.averageScore(studentID: std.value.ID!)
//                    sum["\(std.value.ID!)"] = highScore!
//                }
//            }
//        }
//        currentScore.Sort(sum)
//    }
}

class Major{
    var ID: String?
    var name: String?
}

class Department{
    var ID: String?
    var majors: [String: Major]?
}

class Subject{
    var ID: String?
    var name: String?
    var majorID: String?
}

class Score{
    var ID: String?
    var score: Int?
    var subject: Subject?
    var studentID: String?
    var date: String?
    
    func getScore(studentID: Subject, date: String) -> Bool {
        return true
    }
    
    func averageScore(studentID: String) -> Int? {
        var result: Int = 0
        var index: Int = 0
        for scr in scores {
            if scr.studentID == studentID {
                result += scr.score!
                index += 1
            }
        }
        result = result/index
        return result
    }
    
//    func Sort(sum: [String : Int]) {
//        sum.
//    }
}



