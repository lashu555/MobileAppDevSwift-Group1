import UIKit

for num in 1...10 {
    if num.isMultiple(of: 2) {
        print("\(num) Even")
    } else {
        print("\(num) Odd")
    }
}
var num = 0
while num < 10{
    num+=1
    if num.isMultiple(of: 2) {
        print("\(num) Even")
    } else {
        print("\(num) Odd")
    }
}
var count = 0
repeat{
    count+=1
    if count.isMultiple(of: 2) {
        print("\(count) Even")
    } else {
        print("\(count) Odd")
    }
}while count < 10
///
///
var favorites = ["Chilling adventures of Sabrina", "Gravity Falls", "Rick and Morty", "star and the forces of evil", "alice in the wonderland", "scream queens", "mufasa", "puss in boots", "mr robot", "jojo"]

for (index, media) in favorites.enumerated() {
    var actualIndex = index + 1
    if actualIndex.isMultiple(of: 3) {
        print("\(actualIndex) \(media.uppercased())")
    } else if actualIndex.isMultiple(of: 4) {
        let capitalized = media.split(separator: " ").map { $0.capitalized
        }.joined(separator: " ")
        print("\(actualIndex) \(capitalized)")
    } else {
        print("\(actualIndex) \(media)")
    }
}
favorites.append("shrek")
favorites.forEach{print($0)}
///
///

var studentGrades = ["lashu" : 101, "neo" : 93]

for (student, grade) in studentGrades {
    print("\(student) \(grade)")
}
studentGrades = ["mia" : 63]
print(studentGrades["mia"]!)
//Extra task:
var studentTuple: [(name: String, grade: Int)] =
[
    ("lashu", 101), ("neo", 93), ("mia", 63)
]

for (student, grade) in studentTuple {
    print ("\(student) \(grade)")
}

for (student, grade) in studentTuple {
    if student == "mia" {
        print(grade)
    }
}

studentTuple.append(("shrek", 3))

for (student, grade) in studentTuple {
    print ("\(student) \(grade)")
}
///
///
var person: (name: String, age: Int, city: String) = ("lashu", 20, "Tbilisi")
print(person.name)
print(person.age)
print(person.city)
person.city = "New York"
print(person.city)
///
///
var myShoppingCart: [(product: String, price: Double)] = [
    ("milk", 13.53), ("dark chocolate", 24.54), ("eggs", 12.34)
]
for (product, price) in myShoppingCart {
    print("\(product) \(price)")
}
let totalCost = myShoppingCart.reduce(into: 0) { result, item in
    result += item.price
}
print(totalCost)
print("yasss")
