import UIKit


// Data Types
let myNum = 42 // Int
let myName = "Reum" // String
let isLightOn = true // Bool

// ** Custom Data Types ** : Represent multi-faceted real-world information taht can't be represented with a single value (Int, String, etc)
// When you declare them, start with captial letter (not camel case)

// Build the data types for a coffee app

// * Enums (Enumeration) : very often are used to limit the choices of something ex) roast level? light || medium || dark
// Each "choice" for the enum is added by creating a `case`

enum RoastLevel {
    case light
    case medium
    case dark
}

let myRoastLevel = RoastLevel.medium
let yourRoastLevel: RoastLevel = .dark


// * Struct (Structure)

// When we define the struct here, we are defining the "idea" of Coffee
struct Coffee {
    // * Properties : the individual pieces that make up the data type
    // name, region, roast level
    
    let name: String
    let region: String
    let roastLevel: RoastLevel
}

// The "Instance" of a Coffee
let myCoffee = Coffee(name: "Starbucks", region: "Colombia", roastLevel: RoastLevel.light)
let yourCoffee = Coffee(name: "FONTE", region: "Brazil", roastLevel: .dark)


// * Class : needs initializers && can have a function

class CoffeeShop {
    
    let name: String
    var address: String
    var menu: [Coffee]
    
    // Initializer : The way of taking in the individual parts of a CoffeeShop and turning it into an actual CoffeeShop
    
    init(name: String, address: String, menu: [Coffee]) {
        self.name = name
        self.address = address
        self.menu = menu
    }
    
    func readMenu() {
        print("Our current menu is \(menu).")
    }
    
}

let myShop = CoffeeShop(name: "RR's Coffee", address: "123 Main st.", menu: [])

myShop.address
myShop.readMenu()


// * Optionals : Allow for there to be no value at all (Flexibility!!)

var middleName: String? = nil
var myCar: String? = nil // 14 years old
myCar = "Toyota Camry" // after getting a driver's license and enough money
print(myCar) // Optional("Toyota Camry")

//myCar = nil // no need to keep a car

// Unwrapping Optionals : Taking the box and opening it to see if there is a value or not in the optional property
// Optional Binding : If Let

// I want to print out my car only if there is one.
//if myCar != nil {
//    print(myCar)
//}

if let unWrappedCar = myCar {
    print(unWrappedCar) // "Toyota Camry"
}


// Converting types

let numberString = String(1.99) // "1.99
let wrongNumber = Int("Reum") // nil
let rightNumber = Int("10") // 10

func calculateTip(totalString: String) -> Double? {
    // conver the total into a number using if let (wrapping optional)
    if let total = Double(totalString) {
        let tip = total * 0.2
        return tip
    } else {
    // in the case that the string is not actually a number, return instead?
        return 0.0
    }
    
}

calculateTip(totalString: "32.5") // 6.5
calculateTip(totalString: "HUN") // 0


// Force Unwrapping : `!` >> it could cause 'Fatal error : Unexpetedly found nil while unwrapping an Optional value' when the value is `nil`

var age: Int? = 50

let daysLived = 365 * age! // 18250




