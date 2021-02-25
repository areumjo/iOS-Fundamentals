# iOS-Fundamentals


## 1. Swift Funcamental I

### Data types
- `Int`
- `String` 
- `Bool` : `true` or `false`
- `Double` : a number but has a decimal value

- `let` : declare variables >> can not mutate the value
- `var` : declare variables and can be changed later 
```swift
let number = 5
let string = "Autumn"
let boolean = true
let floatingNumber = 15.95

var totalPrice: Double = 0
let socks = 3.50
let shoelaces = 0.99
totalPrice = socks + shoelaces
```

### Conditional statement
1) `if`
2) `switch` : whichever case is true at runtime, the code underneath it will run // if any of the cases are no found, then default will be executed
```swift
let x = 5
if x > 100 {
  print("Found a large number")
} else {
  print("Smol number")
}

let princess = "Ariel"
switch princess {
  case "Ariel":
    print("The Little Mermaid")
  case let x where x.hasSuffix("el"):
    print("Sister of The Little Mermaid or the one")
  case "Elsa", "Anna":
    print("Frozen")
  case "Jasmine":
    print("Aladin")
  default:
    print("Disney's princess")
}
```


### Iterate over an array using a loop
1) `for` : good to use when the code to be executed needs to run "a specific number" of times
2) `while` : is used when the code block needs to be repeated "an unspecified number" of times
```swift
for n in 1...50 {
  print(n) // 1 2 3 ... 50 : inclusivde of 50
}
for x in 1..<50 {
  print(x) // 1 2 3 ... 49 : not include the upper number
}

let groceries = ["apples", "cereal", "chicken broth", "milk", "oreos"]
var index = 1
for i in groceries {
  print("\(index) - \(i)") // 1 - apples 2 - cereal ...
  index += 1
}
```


### Function
- `func`
  - Setting up the function, we give it a name, a list of parameters(each parameters has a name, followed by a colon and the data type // for many parameters separate them with commas), and a arrow sign and a return type
```swift
let pi = 3.141592

func circleCircumference(radius: Double) -> Double {
  return 2 * pi * radius
}

let circumference = circleCircumference(radius: 10.0)

func circleArea(radius: Double) -> Double {
  return radius * radius * pi
}

func cylinderVolume(radius: Double, height: Double) -> Double {
  let area = circleArea(radius: radius)
  return area * height
}

let volume = cylinderVolume(radius: 10.0, height: 8.5)
```


## 2. Swift Funcamental II

### Custom types
- Swift is an obejct-oriented language.
1. `enum` : allows to create a finite set of options to choose
  - behave like a selection `drop-down`
  - can initialize by 1) using the full type, or 2) using the dot notation if the type is already known via `type inference`
2. `struct` : create a grouping of information that is not all the same type // `value type`
  - will automatically creates an initializer that you can use to populat all of the variables
  - used to store points, rectangles, and sizes in an iPhone app
3. `class` : create a `reference data type` that allows to refer to specific instances throughout an app
  - need `init()` to initialize all of the properties of the class to thte prarmeters passed in, or to default value
  - Class replationships : one class can have other classes

```swift
enum ProductType {
  case laptop
  case phone
  case tv
  case computer
  case accesory
}

let tv = ProductType.tv
let laptop: ProductType = .laptop

struct Purchase {
  let productName: String
  let purchaseDate: Date
  let productType: ProductType
}

let myLaptop = Purchase(productName: "MacBook Pro", purchaseDate: Date(), productType: .laptop)

class Customer {
  var name: String
  var address: String
  var age: Int
  var purchases: [Purchase]

  init(name: String, address: String, age: Int) {
    self.name = name
    self.address = address
    self.age = age
    self.purchases = [] // set up property values to default values (empty array)
  }
}

let autumn = Customer(name: "Autumn Smith", address: "123 Apple st, New York, New York 12344", age: 21)

class Store {
  var name: String
  var address: String
  var customers: [Customer]

  init(name: String, address: String) {
      self.name = name
      self.address = address
      self.customers = []
  }
}

let bestBuy = Store(name: "Best Buy", address: "125 Apple Street, Rochester, NY 14623")
bestBuy.customers.append(autumn)
```

### Value type vs Reference type
- Pass by `Value` : the data is copied when you pass it to functions and properties (or when you assign it to other variables)
- Pass by `Reference` : when the copied object is changed, both the copied and original object is changed >> data `refers` the original data 

```swift
struct DriverLicense {
  var name: String
}

let myDL = DriverLicense(name: "Autumn Smith")
var duplicatedDL = myDL
print(myDL.name) // "Autumn Smith"

duplicatedDL.name = "Winter Smith"
print(duplicatedDL.name) // "Winter Smith"
print(myDL.name) // "Autumn Smith" << the original data is not changed

class Wallet {
  var license: DriverLicense
  var material: String
  init(license: DriverLicense, material: String) {
    self.license = license
    selft.material = material 
  }
}

let myWallet = Wallet(license: myDL, material: "Cotton")

let myFavoriteWallet = myWallet
print(myFavoriteWallet.material) // "Cotton"

myFavoriteWallet.material = "Leather"
print(myWallet.material) // "Leather" << changing a reference type changes the 'shared' object
print(myFavoriteWallet.material) // "Leather"
```

- `init()` : custom initializer
  - set up the default state of an object (an instance of a class) or a structure
- `method` : function in a `class` or `struct` // has access to the instance variables or properties of that type

```swift
class TextDocument {
  var fileName: String
  var text: String
  var isModified: Bool

  init(filename: String, text: String = "") {  // text will be "" as a default
    self.filename = filename
    self.text = text
    self.isModified = false // defulat to not modified
  }

  func duplicate() -> TextDocument {
    let textCopy = TextDocument(filename: filename, text: text)
    textCopy.isModified = isModified
    return textCopy
  }
}

let diary = TextDocument(filename: "Diary.txt", text: "Dear diary, ...")
let duplicatedDiary = diary.duplicate()
```

### Optionals
- A certain variable (or value) could exist or not exist or even be changed : use `?` like Double?, Int?, String?
- Useful when you want a user to type/select a certain data type you choose
- Unwrap an optional variable : `if let` || `guard let`
  - unwrap a value if it exists, or ignore the value if it doesn't exist
- Force unwrap an optional : `!` << if you know the value is not `nil`, you can use force unwrap it
  - this is not defensive way of writing a code!

```swift
var optionalNumber: Int? = nil
optionalNumber = 35
if let number = optionalNumber {
  print("Your number : \(number)")
} else {
  print("What number? I don't see anything.") // when the optionalNumber is nil
}

let todayWeight: Double? = 150 // optional
let desiredWeight = 130

let poundsToLose =  todayWeight! - desiredWeight // forced unwrap!

if todaysWeight != nil { // more defensive 
  let poundsToLose = todayWieght - desiredWeight
} else {
  print("Invalid input")
}