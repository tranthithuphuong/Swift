import UIKit

class Person {
    var id : Int?
    var name : String = ""
    var age : Int?
}

var phuong = Person()
phuong.name = " Trần Thị Thu Phương"
print(phuong.id ?? 1)
print(phuong.age ?? 19)

let score = "9"
let newScore : Int = Int(score)!
print("New Score: \(newScore)")

