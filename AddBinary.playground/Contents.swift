import UIKit

func toPower2(power:Int) -> Int {
    var total = 0
    if power == 0 {
        return 1
    }else{
        total += 2 * toPower2(power:power - 1)
    }
    return total
}

//toPower2(power:0)

func toBinary(baseTen:Int) -> String {
//    var temp = baseTen
//    var str = [Int]()
//    while temp >= 1 {
//        let rem = temp % 2
//        str.insert(rem, at:0)
//        temp = temp / 2
//    }
//    var res = ""
//     str.map {res += String($0)}
    
    if baseTen < 2 { return "\(baseTen)"}
    let divisor = baseTen / 2
    let remainder = baseTen % 2
    
    return toBinary(baseTen: divisor) + "\(remainder)"
}
//toBinary(baseTen:21)


func addBinary(_ a: String, _ b: String) -> String {
    let arr = Array(a)
    let brr = Array(b)
    var aSum = 0
    var bSum = 0
    for i in (0..<a.count).reversed() {
        let index = (a.count - 1)
        let vc = arr[index - i]
        aSum += Int("\(vc)")! * toPower2(power:i)
    }
    print(aSum)
    
    for j in (0..<b.count).reversed() {
        let index = (b.count - 1)
        let vc = brr[index - j]
        bSum += Int("\(vc)")! * toPower2(power:j)
    }
    return toBinary(baseTen:aSum + bSum)
}




func addBinary1(_ a: String, _ b: String) -> String {
    guard a.count > 0 else { return b }
    guard b.count > 0 else { return a }
    
    let arr = Array(Array(a).reversed())
    let brr = Array(Array(b).reversed())
    
    var output = ""
    var remainder = 0
    
    let count = max(arr.count, brr.count)
    for i in 0..<count {
        let val1 = arr.count > i ? Int("\(arr[i])")! : 0
        let val2 = brr.count > i ? Int("\(brr[i])")! : 0
        
        let sum = val1 + val2 + remainder
        output = "\(sum%2)\(output)"
        remainder = sum / 2
    }
    
    if remainder == 1 {
        output = "\(remainder)\(output)"
    }
    
    return output
}
