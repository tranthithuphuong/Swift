import Foundation

class Person {
  var id: String = ""
  var fullName: String = ""
  var birthDate: String = ""
  var gender: String = ""

  func viewInfo(person: Person) {
    print("id | fullName  | birthDate | gender");
    print("\(person.id) | \(person.fullName)  | \(person.birthDate) | \(person.gender)")
  }
}

class Student: Person {
  var studyStatus: String = ""
  var majorID: String = ""
  var schedule: [Schedule] = []

  func viewSchedule() {
    print("schedule of \(fullName)")
    for member in schedule {
      print("day: \(member.day)")
      for subject in member.subjects {
        print("\(subject.name)   |   \(subject.startTime)")
      }
      print("__________________________")
    }
  }
}

class Teacher: Person {
  var employeeID: String = ""
  var departmentID: String = ""
  var schedule: [Schedule] = []
  var isAdmin: Bool = true;

  func viewSchedule() {
    print("schedule of \(fullName)")
    for member in schedule {
      print("day: \(member.day)")
      for subject in member.subjects {
        print("\(subject.name)   |   \(subject.startTime)")
      }
      print("__________________________")
    }
  }
}

class Department {
  var id: String = ""
  var name: String = ""
  var employees: [Teacher] = []
  var headOfDepartment: [Teacher] = []

  func addEmployees(newTeacher: Teacher) -> Bool {
    var count = 0
    for teacher in employees {
      if teacher.id == newTeacher.id {
        count += 1;
      }
    }
    if count == 0 {
      if(newTeacher.isAdmin == false) {
        employees.append(newTeacher)
      } else {
        headOfDepartment.append(newTeacher)
      }
      return true;
    } else {
      print("Your running program has error!!")
      return false;
    }
  }

  func removeEmployees(teacherId: String) {
    for (index,value) in employees.enumerated() {
      if teacherId == value.id {
        employees.remove(at: index)
      }
    }
    for (index, head) in headOfDepartment.enumerated() {
      if teacherId == head.id {
        headOfDepartment.remove(at: index)
      }
    }
  }

  func viewMember(){
    print("member in Department: \(name)")
    print("Employees:")
    print("Name | birthDate | Gender")
    for member in employees {
      print("\(member.fullName) | \(member.birthDate) | \(member.gender)")
    }
    print("headOfDepartment:")
        print("Name | birthDate | Gender")
    for member in headOfDepartment {
      print("\(member.fullName) | \(member.birthDate) | \(member.gender)")
    }
  }


}

class Major { //Nganh
  var id: String = ""
  var name: String = ""
  var departmentID: String = "" //khoa nao

}

class Classes {
  var id: String = ""
  var name: String = ""
  var students: [Student] = []
  var teacher: Teacher = Teacher();
  

  func addStudent(newStudent: Student) -> Bool {
    var counter = 0
    for student in students {
      if student.id != newStudent.id {
        counter += 1
      }
    }

    if counter == students.count {
      students.append(newStudent)
        return true
            } else {
              print("Your running program has error!!")
              return false
            }
          }

          func removeStudent(currentStudentID: String) -> Bool {
              for (index, student) in students.enumerated() {
                if student.id == currentStudentID {
                  students.remove(at: index)
                  return true
                }
              }
              return false
          }

          func displayStudents() {
            print("Students in the class: \(name) ")
            print("Student ID | Name | Birth | Gender")
            for student in students {
              print("\(student.id) | \(student.fullName) | \(student.birthDate) | \(student.gender)")
            }
          }

          func searchStudents(studentID: String, studentName: String) {
            for student in students {
              if studentID != "" && studentName != "" {
                if student.id == studentID && student.fullName == studentName {
                  print("Search result for keyword \(studentID) & \(studentName)")
                  print("Student ID | Name | Birth | Gender")
                  print("\(student.id) | \(student.fullName) | \(student.birthDate) | \(student.gender)")
                }
              } else {
                if student.id == studentID || student.fullName == studentName {
                  print("Search result for keyword \(studentID) & \(studentName)")
                  print("Student ID | Name | Birth | Gender")
                  print("\(student.id) | \(student.fullName) | \(student.birthDate) | \(student.gender)")
                }
              }
            }
          }
        }

        class Semester { //Ky
          var id: String = ""
          var majorID: String = ""
          var startDate: String = ""
          var endDate: String = ""
          var fee: Int = 0
          var classes:[Classes] = []

          func addClass(classAdd: Classes) -> Bool {
            var count = 0;
            for clas in classes {
              if clas.id == classAdd.id {
                count += 1;
              }
            }

            if count == 0 {
              classes.append(classAdd)
              return true
            } else {
              print("Your running program has error!!")
              return false
            }
          }

          func removeClass(classID: String) {
            for (index,value) in classes.enumerated() {
              if classID == value.id {
                classes.remove(at: index)
              }
            }
          }

          func viewClass(){
            print("Class in Semester: \(id)")
            print("Name | teacher | studentCout")
            for clas in classes {
              print("\(clas.name) | \(clas.teacher) | \(clas.students.count)")
            }
          }
        }

        class Subject {
          var id: String = ""
          var semesterId: String = ""
          var startTime: String = ""
          var name: String = ""
          var soTinChi: Int = 0
        }

        class Schedule {
          var id: String = ""
          var day:String = ""

          var subjects: [Subject] = []

          func addSubject(newSubject: Subject) -> Bool {
            var count = 0
            for subject in subjects {
              if newSubject.id == subject.id {
                count += 1
              }
            }
            if count == 0 {
              subjects.append(newSubject)
              return true;
            } else {
              print("Your running program has error!!")
              return false
            }
          }

          func removeSubject(subjectId: String) {
            for (index, subject) in subjects.enumerated() {
              if subjectId == subject.id {
                  subjects.remove(at: index)
                        }
                      }
                    }
                  }

                  let khoaCNTT = Department()
                  khoaCNTT.id = "D0001"
                  khoaCNTT.name = "Khoa Cong nghe thong tin & truyen thong"
                  khoaCNTT.employees = []
                  khoaCNTT.headOfDepartment = []


                  let nganhCongNghePhanMem = Major()
                  nganhCongNghePhanMem.id = "M-CNPM"
                  nganhCongNghePhanMem.departmentID = "D0001"
                  nganhCongNghePhanMem.name = "Cong nghe phan mem"

                  let ky1CNPM = Semester()
                  ky1CNPM.id = "SM0001"
                  ky1CNPM.majorID = "M-CNPM"
                  ky1CNPM.fee = 10000000
                  ky1CNPM.startDate = "05/09/2022"
                  ky1CNPM.endDate = "05/12/2022"



                  let studentChuong = Student()
                  studentChuong.id = "ST0001"
                  studentChuong.fullName = "Nguyen Kha Chuong"
                  studentChuong.birthDate = "06/09/1993"
                  studentChuong.gender = "Male"

                  let studentHuy = Student()
                  studentHuy.id = "ST0002"
                  studentHuy.fullName = "Nguyen Van Huy"
                  studentHuy.birthDate = "01/02/1991"
                  studentHuy.gender = "Female"

                  let teacherPhuong = Teacher();
                  // teacherPhuong.id = "TC0001"
                  // teacherPhuong.departmentID = "DP0001"
                  // teacherPhuong.fullName = "Tran Thi Thu Phuong"
                  // teacherPhuong.birthDate = "09/08/2003"
                  // teacherPhuong.gender = "Female"
                  // teacherPhuong.isAdmin = false;
                  var bol = khoaCNTT.addEmployees(newTeacher: teacherPhuong);

                  let classMobileK16 = Classes()
                  classMobileK16.id = "CL0001";
                  classMobileK16.name = "Mobile K16";
                  classMobileK16.teacher = teacherPhuong;
                  let result = classMobileK16.addStudent(newStudent: studentChuong);
                  // classMobileK16.addStudent(newStudent: studentHuy);
                  // classMobileK16.displayStudents()

                  print(result)
                  // let classMobileK17 = Classes()
                  // classMobileK17.id = "CL0002"
                  // classMobileK17.name = "Mobile K17"
                  // classMobileK17.students = []
                  // classMobileK17.addStudent(newStudent: studentHuy)
                  // classMobileK17.displayStudents()

                  classMobileK16.searchStudents(studentID: "ST0001", studentName: "Nguyen Kha Chuong")
