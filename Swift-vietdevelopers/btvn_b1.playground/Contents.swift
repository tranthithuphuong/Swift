
import Foundation
//BTVN:
//1, cho vào 1 mảng tên, lấy ra những người có tên bắt đầu là nguyên âm ( u, e, o, a, i )
//2, cho vào 1 mảng số nguyên, đảo ngược mảng số đấy
//3, cho vào 1 mảng chuỗi, đổi vị trí từng cặp cho nhau
//4 + 5 : Nợ trên lớp ^^

//bai1

let names:[String] = ["Ungel", "Echo", "Phuong", "Issac", "Dang", "Nhat", "Old", "Array"];
print("Bai 1")
for i in 0..<names.count { //duyệt từng phần tử từ 0 -> 7
    let index = names[i].index(names[i].startIndex, offsetBy: 1)// lấy vị trí đầu tiên
    if(names[i].substring(to: index).lowercased() == "u" || names[i].substring(to: index).lowercased() == "e" || names[i].substring(to: index).lowercased() == "o" || names[i].substring(to: index).lowercased() == "a" || names[i].substring(to: index).lowercased() == "i") {
          print(names[i])
    }
}
print("----------------")

//bai2
print("Bai 2")
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
print("----------------")

//bai3
print("Bai 3")
var Text:[String] = ["Some", "Hello", "Good", "Bad", "Love", "You"];

for i in 0..<Text.count {
  if(i % 4 == 0) {
    let tg = Text[i];
    Text[i] = Text[i+1];
    Text[i+1] = tg;
  }
}
print(Text);
print("--------------")

//bai4
print("Bai 4")
var nameHight:[String] = []
var nameLow:[String] = []
var name1 = ["Chuong", "Cuc", "Khanh", "Chau"] // nameHight
var name2 = ["Huy", "Tu", "Yen"] //nameLow
var name3 :[String] = []
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
print("--------------")

//bai5
print("Bai 5")
var name4 : [String] = []
for(index, _) in name3.enumerated(){
    if index % 2 == 0 {
        let love = "\(name3 [index]) ❤️ \(name3 [index+1])"
        name4.append(love)
    }
}
print(name4)

