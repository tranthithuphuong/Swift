//
//  ViewController.swift
//  DemoTableView
//
//  Created by devvn on 8/30/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var students: [Student] = []
    @IBOutlet weak var tblStudents: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblStudents.delegate = self
        tblStudents.dataSource = self
        let firstStudent = Student(name: "Nguyen Kha Chuong", id: "S10001", avatar: "chuong.png")
        students.append(firstStudent)
        let secondStudent = Student(name: "Nguyen The Chau", id: "S10002", avatar: "chau.png")
        students.append(secondStudent)

    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblStudents.dequeueReusableCell(withIdentifier: "cellStudentInfo", for: indexPath)
        let imgStudentAvatar = cell.viewWithTag(101) as! UIImageView
        let lblStudentName = cell.viewWithTag(102) as! UILabel
        let lblStudentID = cell.viewWithTag(103) as! UILabel
        if indexPath.row % 2 == 0 {
            lblStudentName.textColor = .red
        }
        lblStudentName.text = students[indexPath.row].name
        
        lblStudentID.text = students[indexPath.row].id
        return cell
    }
    


}

struct Student {
    var name: String
    var id: String
    var avatar: String
}
