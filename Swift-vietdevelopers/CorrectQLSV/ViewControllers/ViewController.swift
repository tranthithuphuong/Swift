//
//  ViewController.swift
//  CorrectQLSV
//
//  Created by chuottp on 06/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var btnWatch: UIButton!
    
    @IBOutlet weak var lblTopSearch: UILabel!
    @IBOutlet weak var lblHistory: UILabel!
    @IBOutlet weak var tblSearchStudent: UITableView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
   
    @IBAction func btnViewDetailPressed(_ sender: UIButton) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
       // detailVC.fullName = students[indexPath.row].name
        let currentInforStudent = students[indexPath.row]
        detailVC.currentStudent = currentInforStudent
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text!.isEmpty {
            lblResult.isHidden = true
            return students.count
        }
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSearchStudent.dequeueReusableCell(withIdentifier: "tblSearchResultCell", for: indexPath)
        let lblStudentName = cell.viewWithTag(1) as! UILabel
        let lblStudentEmail = cell.viewWithTag(2) as! UILabel
        let lblStudentPhone = cell.viewWithTag(3) as! UILabel
        
        var currentInforStudent = students[indexPath.row]
        
//        let greenColor = UIColor(red: 10/255, green: 190/255, blue: 50/255, alpha: 1)
//        let attributsBold = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor : greenColor, ]
        
//        let boldStringPart = NSMutableAttributedString(string: searchBar.text!, attributes:attributsBold)
        
        if searchResults.count > 0 {
            currentInforStudent = searchResults[indexPath.row]
//            lblStudentName.attributedText = boldStringPart
//            lblStudentPhone.attributedText = boldStringPart
//            lblStudentEmail.attributedText = boldStringPart
        }
        
        

        
        lblStudentName.text = currentInforStudent.name
        lblStudentEmail.text = currentInforStudent.email
        lblStudentPhone.text = currentInforStudent.phoneNumber
        
        return cell
    }
    
    var students : [Student] = []
    var searchResults : [Student] = []
    var searchHistory : [History] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSearchStudent.dataSource = self
        tblSearchStudent.delegate = self
        initData()
    }
    
    //MARK: Action search student information
    @IBAction func btnSearch(_ sender: UIButton) {
        if var keyword = searchBar.text {
            
            //MARK: add keyword to history array and render
            appendSearch(keyword: keyword)
            renderHistory()
            
            //MARK: render Top Search
            renderTopSearch()
            
            searchResults = []
            
            //MARK: Find name by sort Name
            switch(keyword.lowercased()) {
            case "phg":
                keyword = "Phuong"
                break;
            case "en":
                keyword = "Yen"
                break;
            case "ee":
                keyword = "Yen"
                break;
            case "yn":
                keyword = "Yen"
                break;
            case "dg":
                keyword = "Dang"
                break;
            default:
                break;
            }
            // ------ //
            
            
            searchStudents(keyword: keyword.lowercased())
            
        }else{
            lblResult.text = "Vui lòng nhập thông tin!"
        }
    }
    
    
    @IBAction func Filtered(_ sender: UIButton) {
        filter(btnID: (sender.titleLabel?.text!)!)
    
    }
    
    func filter(btnID: String) {
//        searchResults = searchResults.filter({
//            let firstName = $0.name.components(separatedBy: " ")
//            if firstName[firstName.count - 1].starts(with: btnID) {
//                return $0.name
//            }
//        })
        print(searchResults)
        tblSearchStudent.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func appendSearch(keyword: String) {
        if searchHistory.count > 0 {
            var count : Int = 0;
            for (index, search) in searchHistory.enumerated() {
                if(keyword == search.Search) {
                    searchHistory[index].total += 1
                    count += 1
                    break;
                }
            }
            if(count == 0) {
                searchHistory.append(History(Search: keyword, total: 1))
            }
        } else {
            searchHistory.append(History(Search: keyword, total: 1))
        }
    }
    func renderHistory() {
        lblHistory.text = ""
        for search in searchHistory {
            lblHistory.text! += "\(search.Search), "
        }
    }
    
    func renderTopSearch() {
        lblTopSearch.text = ""
        for search in searchHistory {
            if search.total >= 3 {
                lblTopSearch.text! += "\(search.Search), "
            }
        }
    }
    
    func searchStudents(keyword: String) {
        for currentStudent in students {
            if currentStudent.name.lowercased().contains(keyword) || currentStudent.id.lowercased().contains(keyword) || currentStudent.email.lowercased().contains(keyword) || currentStudent.phoneNumber.lowercased().contains(keyword) {

                searchResults.append(currentStudent)
            }
        }
        
        //MARK: Sort searchResults array by name
        searchResults.sort {
            $0.name < $1.name
        }
        
        lblResult.isHidden = false
        lblResult.text = "Tìm được \(searchResults.count) sinh viên"
        tblSearchStudent.reloadData()
        
    }
    
    
    func initData() {
        let firstStudent = Student(id: "S001", name: "Trần Thị Thu Phương", email: "phuongttt@gmail.com", phoneNumber: "0969691630")
        let secondStudent = Student(id: "A002", name: "Lê Thị Yến", email: "yenpt@gmail.com", phoneNumber: "06238927913")
        let thirdStudent = Student(id: "A003", name: "Nguyễn Thị Yến", email: "yennt@gmail.com", phoneNumber: "0364339520")
        let fourthStudent = Student(id: "A004", name: "Trần Nam Anh", email: "anhtn@gmail.com", phoneNumber: "0356769119")
        let fifthStudent = Student(id: "A005", name: "Nguyễn Hoàng An", email: "annh@gmail.com", phoneNumber: "0396265650")
        let sixthStudent = Student(id: "A006", name: "Nguyễn Quang Đăng", email: "dangnq@gmail.com", phoneNumber: "09692143452")
        let seventhStudent = Student(id: "A007", name: "Lê Thị Ngọc Anh", email: "anhltn@gmail.com", phoneNumber: "456789209302")
        students.append(firstStudent)
        students.append(secondStudent)
        students.append(thirdStudent)
        students.append(fourthStudent)
        students.append(fifthStudent)
        students.append(sixthStudent)
        students.append(seventhStudent)
    }
    

}

struct Student {
    var id: String
    var name: String
    var email: String
    var phoneNumber: String
}

struct History {
    var Search: String
    var total: Int
}
