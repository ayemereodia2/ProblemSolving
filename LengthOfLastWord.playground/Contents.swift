import UIKit

var greeting = " a"
var arr = greeting.components(separatedBy:" ")

var stack = [String]()

for str in arr {
    stack.append(str)
}

for _ in arr {
    if let firstString = stack.popLast(){
        if firstString.count > 1 {
            print(firstString)
            break
        }
    }
}
