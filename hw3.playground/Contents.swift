import Foundation

protocol Shape{
    func area() -> Double
}
struct Rectangle: Shape{
    let width: Double
    let height: Double
    var description: String { return "Rectangle" }
    func area() -> Double {
        return width * height
    }
}
struct Circle: Shape{
    let radius: Double
    var description: String { return "Circle" }
    func area() -> Double {
        return .pi * (radius*radius)
    }
}
extension Shape{
    var description: String { return "shape" }
}
let rectangle = Rectangle(width: 5, height: 10)
print(rectangle.area()) // Output: 50.0
print(rectangle.description) // Output: Rectangle

let circle = Circle(radius: 7)
print(circle.area()) // Output: ~153.94
print(circle.description) // Output: Circle
/*/
 /*/*/
    */*/*/
class Person{
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func greet(){
        print("Hi, I'm \(name) and I'm \(age) years old.")
    }
}
class Employee: Person{
    var jobTitle: String
    init(jobTitle: String, name: String, age: Int) {
        self.jobTitle = jobTitle
        super.init(name: name, age: age)
    }
    override func greet(){
        print("Hi, I'm \(name), a \(jobTitle), and I'm \(age) years old.")
    }
}
let person = Person(name: "Alice", age: 25)
person.greet() // Output: Hi, I'm Alice and I'm 25 years old.

let employee = Employee(jobTitle: "Engineer", name: "Bob", age: 30)
employee.greet() // Output: Hi, I'm Bob, a Engineer, and I'm 30 years old.
/*/
 /*/*/
    */*/*/
protocol Appliance{
    var powerUsage: Double { get }
    func calculateMonthlyConsumption(hours: Double) -> Double
}
struct WashingMachine:Appliance{
    let powerUsage: Double = 500
    
    func calculateMonthlyConsumption(hours: Double) -> Double {
        hours * powerUsage
    }
}
struct Refrigerator:Appliance{
    let powerUsage: Double = 100
    
    func calculateMonthlyConsumption(hours: Double) -> Double {
        hours * powerUsage
    }
}
extension Appliance{
    var description: String {
        return "This appliance uses \(powerUsage) watts each month."
    }
    func calculateMonthlyConsumption(hours: Double) -> Double {
        return hours * powerUsage
    }
}
let washingMachine = WashingMachine()
print(washingMachine.description) // Output: This appliance uses 500 watts.
print(washingMachine.calculateMonthlyConsumption(hours: 30)) // Output: 15,000 watts

let refrigerator = Refrigerator()
print(refrigerator.description) // Output: This appliance uses 100 watts.
print(refrigerator.calculateMonthlyConsumption(hours: 720)) // Output: 72,000 watts
/*/
 /*/*/
    */*/*/
struct Book: Equatable {
    let title: String
    let author: String
}
protocol Borrowable {
    func borrow(book: Book)
    func returnBook(book: Book)
}
class Library: Borrowable{
    var books: [Book]
    var lentBooks: [Book] = []
    init(books: [Book] = []) {
        self.books = books
    }
    func addBook(book: Book){
        books.append(book)
    }
    func removeBook(book: Book){
        books.removeAll(where: {$0 == book})
    }
    func borrow(book: Book) {
        if books.contains(book){
            print("Borrowed \(book.title)")
            books.removeAll(where: {$0 == book})
            lentBooks.append(book)}
        else{
            print("this book is not in the library")
        }
    }
    func returnBook(book: Book) {
        if lentBooks.contains(book){
            books.append(book)
            lentBooks.removeAll(){ $0 == book
            }
        }
        else{
            print("this book has not been borrowed")
        }
    }
}
extension Library{
    func listBooks(){
        for (index, book) in books.enumerated(){
            let actualIndex = index + 1
            print("\(actualIndex). \(book.title)")
        }
    }
}
var library = Library()
let book1 = Book(title: "1984", author: "George Orwell")
let book2 = Book(title: "To Kill a Mockingbird", author: "Harper Lee")
library.addBook(book: book1)
library.addBook(book: book2)

library.listBooks()
// Output:
// 1. 1984 by George Orwell
// 2. To Kill a Mockingbird by Harper Lee

library.borrow(book: book1)
// Output: Borrowed 1984
library.listBooks()
// Output: 1. To Kill a Mockingbird by Harper Lee
/*/
 /*/*/
    */*/*/
class Vehicle{
    let make: String
    let model: String
    let fuelEfficiency: Double
    init(make: String, model: String, fuelEfficiency: Double) {
        self.make = make
        self.model = model
        self.fuelEfficiency = fuelEfficiency
    }
    func calculateFuelNeeded(for distance: Double) -> Double{
        distance / fuelEfficiency
    }
}
class ElectricCar: Vehicle{
    let batteryCapacity: Double
    init(batteryCapacity: Double, make: String, model: String, fuelEfficiency: Double = 0) {
        self.batteryCapacity = batteryCapacity
        super.init(make: make, model: model, fuelEfficiency: fuelEfficiency)
    }
    override func calculateFuelNeeded(for distance: Double) -> Double {
        (distance / batteryCapacity) * 10
    }
}
extension Vehicle{
    func description(){
        print("\(make) and \(model)")
    }
}
let car = Vehicle(make: "Toyota", model: "Corolla", fuelEfficiency: 15)
print(car.calculateFuelNeeded(for: 150)) // Output: 10.0 liters

let tesla = ElectricCar(batteryCapacity: 50, make: "Tesla", model: "Model 3")
print(tesla.calculateFuelNeeded(for: 150)) // Output: 30.0 kWh
