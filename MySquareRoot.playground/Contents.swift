import UIKit

func toPower(power:Double) -> Int {
    var total = 0
    let n = 25
    if power == 0 {
        return 1
    }else{
        total += n * toPower(power:power - 1)
    }
    return total
}

func squared(_ x:Int) -> Int {
   return Int(sqrt(Double(x)))
}

