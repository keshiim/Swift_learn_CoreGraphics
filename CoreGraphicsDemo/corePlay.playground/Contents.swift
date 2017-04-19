//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let a: Int = 232

let emptyArray = [String]()

let emptyDictionary = [String: Float]()

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

var total = 0
for i in 0...4 {
    total += i
}
print(total)

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func asdfdsf(a: String, b: String) -> Bool {
    return true
}
var names = ["adf", "aadf"]
let valuesss: (String, String) ->Bool = asdfdsf

names = names.sorted(by: { (a, b) -> Bool in
    return a > b
})







