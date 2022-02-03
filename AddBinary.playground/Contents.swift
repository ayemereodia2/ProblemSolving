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
    var temp = baseTen
    var str = [Int]()
    while temp >= 1 {
        let rem = temp % 2
        str.insert(rem, at:0)
        temp = temp / 2
    }
    var res = ""
     str.map {res += String($0)}
    return res
}
//toBinary(baseTen:4)


func addBinary(_ a: String, _ b: String) -> String {
    let arr = Array(a)
    let brr = Array(b)
    var aSum = 0
    var bSum = 0
    for i in 0..<a.count {
        let vc = arr[i]
        aSum += Int("\(vc)")! * toPower2(power:i)
    }
    print(aSum)
    
    for j in 0..<b.count {
        let vc = brr[j]
        bSum += Int("\(vc)")! * toPower2(power:j)
    }
    return toBinary(baseTen:aSum + bSum)
}

addBinary("11","1")
