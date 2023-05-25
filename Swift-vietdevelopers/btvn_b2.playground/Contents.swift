
import Foundation;


print("Bai 1");

print("-----------\n");


print("bài 2")

func action1() {
  let names:[String] = ["Ungel", "Echo", "Phuong", "Issac", "Dang", "Nhat", "Old", "Array"];
  for i in 0..<names.count { //duyệt từng phần tử từ 0 -> 7
      let index = names[i].index(names[i].startIndex, offsetBy: 1)// lấy vị trí đầu tiên
      if(names[i].substring(to: index).lowercased() == "u" || names[i].substring(to: index).lowercased() == "e" || names[i].substring(to: index).lowercased() == "o" || names[i].substring(to: index).lowercased() == "a" || names[i].substring(to: index).lowercased() == "i") {
  print(names[i])
      }
  }
}

func action2() {
  var numbers:[Int] = [1,2,3,4,5,6,7,8,9,10];
  var j = numbers.count;
  for i in 0..<numbers.count {
    j -= 1;
    if(j - 1 == i) {
      break;
    } else {
      let tg = numbers[i];
      numbers[i] = numbers[j];
      numbers[j] = tg;
    }
  }
  print(numbers);
}

func action3() {
  var Text:[String] = ["Some", "Hello", "Good", "Bad", "Love", "You"];

  for i in 0..<Text.count {
    if(i % 4 == 0) {
      let tg = Text[i];
      Text[i] = Text[i+1];
      Text[i+1] = tg;
    }
  }
  print(Text);
}

  var name3 :[String] = []
func action4() {
  var nameHight:[String] = []
  var nameLow:[String] = []
  let name1 = ["Chuong", "Cuc", "Khanh", "Chau"] // nameHight
  let name2 = ["Huy", "Tu", "Yen"] //nameLow

  if (name1.count >= name2.count) {
      nameHight = name1;
      nameLow = name2;
  } else if (name2.count > name1.count) {
      nameHight = name2;
      nameLow = name1;
  }
  for i in 0..<nameHight.count {
      if (i >= nameLow.count) {
          name3 += ["\(nameHight[i])"]
          name3 += ["no one"]
      } else {
          name3 += ["\(nameHight[i])"]
          name3 += ["\(nameLow[i])"]
      }
  }
  print(name3)
}

func action5() {
  var name4 : [String] = []
  for(index, _) in name3.enumerated(){
      if index % 2 == 0 {
          let love = "\(name3 [index]) ❤️ \(name3 [index+1])"
          name4.append(love)
      }
  }
  print(name4)
}

action1();
print("------------------------\n")
action2();
print("------------------------\n")
action3();
print("------------------------\n")
action4();
print("------------------------\n")
action5();

print("------------------------\n")
print("Bài 3");

struct nation {
  var name: String;
  var phone: String;
}

var nations:[nation] = [nation(name: "VietNam", phone: "+84"),nation(name: "Canada", phone: "+1"),nation(name: "Nga", phone: "+7"),nation(name: "Đức", phone: "+49"),nation(name: "Anh", phone: "+44"),nation(name: "Nhật Bản", phone: "+81"),nation(name: "Hàn Quốc", phone: "+82"),nation(name: "Trung Quốc", phone: "+86"),nation(name: "Đài Loan", phone: "+886")];

var result:String = findnumber(value: "VietNam");

func findnumber(value: String) -> String {
  var result:String = "";
  for (index,_) in nations.enumerated(){
    if(value == nations[index].name) {
      result =  "\(nations[index].name) => \(nations[index].phone)"
      break;
    }
  }
  return result;
}

print(result);

print("----------------\n");
print("Bai4");

let date = Date();
var dateFormat = DateFormatter();
dateFormat.dateFormat = "HH mm dd MM YYYY";
var arr :  String = dateFormat.string(from: date);
var arrdate : [String] = arr.components(separatedBy: " ")

print(arrdate)









