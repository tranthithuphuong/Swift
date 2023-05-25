import UIKit

struct Student{
    var id: String
    var name: String
    var CCCD: String
    var mathScores: Int
    var literatureScores: Int
    var englishScore: Int
}

struct Class{
    var idClass: String
    var nameClass: String
    var Students: [Student]
}

var phuong = Student(id: "sv1", name: "Tran Thi Thu Phuong", CCCD: "038303002932", mathScores: 8, literatureScores: 6, englishScore: 5)
var yen = Student(id: "sv2", name: "Pham Thi Yen", CCCD: "34567891283273", mathScores: 9, literatureScores: 6, englishScore: 7)
var xoai = Student(id: "sv3", name: "Nguyen Kha Minh Nhat", CCCD: "23677812731276", mathScores: 7, literatureScores: 7, englishScore: 5)

var class1 = Class(idClass: "1", nameClass: "Class1", Students: [])
var class2 = Class(idClass: "2", nameClass: "Class2", Students: [])

var studentList:[String: Student] = [:]
studentList["038303002932"] = phuong
studentList["34567891283273"] = yen
studentList["23677812731276"] = xoai

var classList:[String: Class] = [:]
classList["Class1"] = class1
classList["Class2"] = class2


//Them sinh vien
func addStudent(cccdNumber: String, Class: String) {
    classList["\(Class)"]?.Students.append(studentList["\(cccdNumber)"]!)
//    print(classList)
}
addStudent(cccdNumber: "038303002932", Class: "Class1")
addStudent(cccdNumber: "34567891283273", Class: "Class1")
addStudent(cccdNumber: "23677812731276", Class: "Class2")

//update sinh vien
func updateStudent(cccdNumber: String, id: String, nameStudent: String, cccdStudent: String, mathScores: Int, literatureScores: Int, englishScore: Int){
    var informationStudent = studentList["\(cccdNumber)"]
    informationStudent?.id = id
    informationStudent?.name = nameStudent
    informationStudent?.CCCD = cccdStudent
    informationStudent?.mathScores = mathScores
    informationStudent?.literatureScores = literatureScores
    informationStudent?.englishScore = englishScore
    studentList.updateValue(informationStudent!, forKey: "\(cccdNumber)")
//    print(studentList)
}


