import UIKit

var greeting = "Hello, 12"

print("greeting \(greeting)")


let random = Float.random(in: 0..<3)
print(random)

Bool.random()

var tempArray = [1,2,3,7,34,5,2,3,4,2,4,7,8,9,67,9,0]

tempArray.randomElement()
tempArray.shuffle()

print(tempArray[0...2])
