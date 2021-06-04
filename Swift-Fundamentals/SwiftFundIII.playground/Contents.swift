import UIKit

// Conditional Statement

func checkTemp() {
    
    let temperature = Int.random(in: 1...100)

    
    // write an if statement that prints "It's nice outside" if the temp is greater than 70, or "It's little chilly"
    
    if temperature > 70 {
        print("It's nice outside")
    } else if temperature <= 70 {
        print("It's little chilly")
    }
    
}

checkTemp()


// Guard Statement : 1) conditional is flipped, 2) need 'return'

func checkTemp2() {

    let temperature = Int.random(in: 1...100)

    guard temperature > 70 else {
        print("It's little chilly")
        return // stop running the function >> if conditional does not meet the 'guard' then finish here
    }
    print("It's nice outside")
    print("Finished")
}

checkTemp2()


func checkBirthday() {
 
    let isMyBirthday = Bool.random()
    
    guard isMyBirthday == true else {
        print("It is not my birthday")
        return
    }
    
    print("Happy birthday!")
    print("End of func")

}

checkBirthday()



// Optional Binding - if let

func showOffCar() {

    var myCar: String? = "Honda Civic"
    var myBroCar: String? = "Ford F-150"
    
    print(myCar) // will print Optional
    
    if let unwrappedCar = myCar, let unwrappedCar2 = myBroCar {
        print(unwrappedCar, unwrappedCar2) // "Honda Civic"
    } else {
        print("I don't have a Car")
    }
}

showOffCar()


func showOffCar2() {

    var myCar: String? = "Honda Civic"
    
    guard let unwrappedCar = myCar else {
        print("I don't have a car")
        return
    }
    print(unwrappedCar)
}

showOffCar2()


// Nil Coalescing Operator : ??

let myCar: String? = nil
let sisCar: String = "Subaru"
let optionalCar: String? = "Tesla"
print(myCar ?? sisCar) // can interpret as "OR"
print(myCar ?? "No car")


// Optional Chaining
print(sisCar.count)
print(myCar?.count)
print(optionalCar?.count) // Optional(5)


// Composition (what things it has) vs Inheritance
class Shape {
    var color: String
    
    init(externalColor: String) {
        self.color = externalColor
    }
}

let myShape = Shape(externalColor: "Red")


// Inheritance is the ability to inherit or gain all of the properties and functions of a different class
class Rectangle: Shape {
    // var color: String // get it behind of the scene even if you didn't put anything
    
    var length: Double
    var height: Double
    
    init(length: Double, height: Double, color: String) {
        self.length = length
        self.height = height
        // still need to give the color a value
        super.init(externalColor: color)
    }
    
}

let myRectangle = Rectangle(length: 10, height: 10, color: "Green")

let myShapes: [Shape] = [myShape, myRectangle]

// I want to print out the shape's height if it is a rectangle, or if it's a generic shape print out the color

for shape in myShapes {
    
    // "are you a rectangle?"
//    let rectangle = shape as? Rectangle
//    print(rectangle?.height)
    
    if let rectangle = shape as? Rectangle {
        print(rectangle.height)
    } else {
        print(shape.color)
    }
    
}
