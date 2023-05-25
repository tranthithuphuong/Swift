import Foundation;
//Quản lý thư viện

struct Date {
  var day: Int;
  var month: Int;
  var year: Int;
}

struct Gender {
  var gender: String;
}

var male = Gender(gender: "Nam");
var feMale = Gender(gender: "Nữ");

struct Person {
  var id : String;
  var name: String;
  var Age: Int;
  var phoneNumber: String;
  var Gender : Gender;

  func updateInfo(personId: Stirng) -> Bool {
    return true
  }
}
let PersonDic:[String: Person] = [:]

let Phuong = Person(id: "chuot",name: "Trần Thị Thu Phương", age: 18,phoneNumber: "0969691630",Gender: feMale);

let Dang = Person(id: "meo",name: "Nguyễn Quang Đăng",age: 18,phoneNumber: "0396265650",Gender: male);

PersonDic["Phương"] = Phuong;
PersonDic["Đăng"] = Dang;

struct Author {
  var id: String;
  var name: String;
  var gender: Gender;
}


struct NXB {
  var id: String;
  var name: String;
  var address: String;
}

struct Book {
  var ngaySX: Date;
  var id: String;
  var Name: String;
  var Author: Author;
  var location: String;
  var NXB: NXB;
  var type: String;
  var pageCount: Int;
}

struct ticket {
  var id: String;
  var person: Person;
  var book: Book;
  var borrowedDate: Date;

  func upDateTicket(ticketId: String) -> Bool {
    return true
  }
}


struct bookArea {
  var id: String;
  var name: String;
  var book : [String: Book];

  func isBookExist(bookId: String) -> Bool {
    return true
  }
  
  func addBook(bookId: String) -> Bool {
    return true
  }

  func removeBook(bookId: String) -> Bool {
    return true
  }

  
}

struct libary {
  var id: String;
  var name: String;
  var manager: Person;
  var bookRows: [String: bookArea];
  
  func isBookRowExist(bookAreaId: String) -> Bool {
    return true
  }

  func addBookRow(bookAreaId: String) -> Bool {
    return true
  }

  func removeBookRow(bookAreaId: String) -> Bool {
    return true
  }
}


//Quản lý tin tức

struct Date {
  var day: Int;
  var month: Int;
  var year: Int;
}

struct Gender {
  var gender: String;
}

var male = Gender(gender: "Nam");
var feMale = Gender(gender: "Nữ");

struct Person {
  var id : String;
  var name: String;
  var Age: Int;
  var phoneNumber: String;
  var Gender : Gender;

  func updateInfo(personId: Stirng) -> Bool {
    return true
  }
}
let PersonDic:[Stirng: Person] = [:]

let Phuong = Person(id: "chuot",name: "Trần Thị Thu Phương", age: 18,phoneNumber: "0969691630",Gender: feMale);

let Dang = Person(id: "Meo",name: "Nguyễn Quang Đăng",age: 18,phoneNumber: "0396265650",Gender: male);

PersonDic["Phương"] = Phuong;
PersonDic["Đăng"] = Dang;

struct Group {
  var id: Stirng;
  var member:[String: Person];
  var category:[String: Cate];
  var isActive: Bool;

  func isPersonExsit(personId: String) -> Bool {
    return true
  }

  func addPerson(personId: String) -> Bool {
    return true
  }

  func removePerson(personId: String) -> Bool {
    return true
  }
}

struct Cate {
  var id: String;
  var name: String;
  var Postnew:[String: New];

  func isPostnewExsit(personId: String) -> Bool {
    return true
  }

  func addPostNew(personId: String) -> Bool {
    return true
  }

  func removePostnew(personId: String) -> Bool {
    return true
  }
}

struct New {
  var id: String;
  var title: String;
  var content: String;
  var admin: Person;
  var emotion: [String: emotion];
  var comment: [String: cmt];
  var date: Date;

  func updateInfo(newId: String) -> Bool {
    return true
  }
}

struct emotion {
  var like=like;
  var heart=heart;
}

struct cmt {
  var id: String;
  var admin: Person;
  var content: String;
    
    
func updateContent(cmtId: String) -> Bool {
    return true
  }
}
