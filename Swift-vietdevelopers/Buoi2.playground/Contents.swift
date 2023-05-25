import UIKit
import Foundation

struct Contact{
    var name: String
    var mobile: Int
    var job: String
    var email: String
    var addressWork: String
    var pictureIntroduce: String
}
var Chuong = Contact(name: "Nguyễn Khả Chương", mobile: 0374647306, job: "TP Kỹ thuật Công nghệ Viettel", email: "chuongnk@viettel.com.vn", addressWork: "Toà nhà Thành Công", pictureIntroduce: "Picture 1")
var Phuong = Contact(name: "Trần Thị Thu Phương", mobile: 0969691630, job: "Sinh Viên", email: "phuongtttph28706@fpt.edu.vn", addressWork: "Phố Trịnh Văn Bô", pictureIntroduce: "Picture 2")

var listContact:[Contact] = []
listContact.append(Chuong)
listContact.append(Phuong)


var contactDic: [String:Contact] = [:]
contactDic["Chương"] = Chuong
contactDic["Chuot"] = Phuong

for(key, value) in contactDic {
    if key == "Chương" {
        print(value)
    }
}


func search(keyword: String) -> [Contact] {
    var result: [Contact] = []
    for(key, value) in contactDic {
        if key.contains(keyword) {
            var tempValue = value
            let newName = tempValue.name.replacingOccurrences(of: keyword, with: "❤️")
            tempValue.name = newName
            result.append(tempValue)
        }
    }
    return result
}
print(search(keyword: "Chương"))



