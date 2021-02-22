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