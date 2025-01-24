import UIKit

// factorial function n! = n*(n-1)
func factorial(num: Int?) -> Int {
    guard let num, num > 0 else{
        print("num is nil or negative")
        return 0
    }
    var count = 1
    var factorial = num
    while num > count{
        factorial *= count
        count += 1
    }
    return factorial
}
factorial(num: -2)
//
struct Student: Hashable{
    private var name: String
    private var grades: [Double]
    init(name: String, grades: [Double]) {
        self.name = name
        self.grades = grades
    }
    private func averageGrade(for student: Student, inClass: [String: Student] ) -> Double{
        let studentGradesSum = inClass.first(where: {$0.key == student.name})?.value.grades.reduce(0, { partialResult, grade in
            partialResult + grade
        })
        guard let studentGradesSum else { return 0 }
        return studentGradesSum / Double(student.grades.count)
    }
    private func bestStudent(inClass students: [String: Student]) -> [Student : Double]{
        var highestAvg = 0.0
        var highestAvgStudent: Student?
        for (name, student) in students {
            let averageGrade = student.grades.reduce(0, +) / Double(student.grades.count)
            if averageGrade > highestAvg {
                highestAvg = averageGrade
                highestAvgStudent = student
            }
        }
        guard let highestAvgStudent else { return [:] }
        return [highestAvgStudent : highestAvg]
    }
}
///
///
func findLongestWord(in words: [String?]) -> String? {
    guard !words.isEmpty else { return nil }
    if words.count == 1 { return words[0] }
    
    let firstWord = words[0]
    let restOfWords = Array(words.dropFirst())
    let longestInRest = findLongestWord(in: restOfWords)
    
    guard let currentWord = firstWord else { return longestInRest }
    guard let otherWord = longestInRest else { return currentWord }
    
    return currentWord.count >= otherWord.count ? currentWord : otherWord
}
///
///
struct ShoppingItem{
    var name: String
    var quantity: Int
    var isPurchased: Bool
}
struct ShoppingList {
    private var items: [String: ShoppingItem]
    init() {
        items = [:]
    }
    mutating func addItem(item: ShoppingItem) {
        self.items[item.name] = item
    }
    mutating func markAsPurchased(item: ShoppingItem){
        self.items[item.name]?.isPurchased = true
    }
    mutating func markAsPurchased(itemName: String){
        self.items[itemName]?.isPurchased = true
    }
    mutating func listUnpurchasedItems() -> [ShoppingItem] {
        let items = self.items.values.filter {!$0.isPurchased}
        print(items)
        return items
    }
}
var shoppingList = ShoppingList()
let myShoppingItem1 = ShoppingItem(name: "Banana", quantity: 5, isPurchased: false)
let myShoppingItem2 = ShoppingItem(name: "Orange", quantity: 3, isPurchased: false)
shoppingList.addItem(item: myShoppingItem1)
shoppingList.addItem(item: myShoppingItem2)
shoppingList.markAsPurchased(itemName: "Orange")
let unpurchased = shoppingList.listUnpurchasedItems()
