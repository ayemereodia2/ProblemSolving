import UIKit

class SolutionRomanToInt {
    func romanToInt(_ s: String) -> Int {
        
        let arr = Array(s)
        let keyPair:[Character:Int] = ["I": 1, "V": 5, "X":10, "L":50, "C":100, "D": 500, "M":1000]
        let keyPairInstances:[String:Int] = ["IV": 4, "XL": 40, "IX":9, "XC":90, "CD":400, "CM": 900]

        let uniqueSet:Set<Character> = ["I","V","L","X","C","D","M"]
        
        if s.count >= 16 || s.count < 1  {
            return 0
        }else if s.count == 1 {
            for item in arr {
                if !uniqueSet.contains(item) {
                    return 0
                }
            }
            guard let single = keyPair[Character(s)] else {return 0}
            return single
        }
        else {
            for item in arr {
                if !uniqueSet.contains(item) {
                    return 0
                }
            }
            var output = [Int]()
            var x = 0
            var y = 1
            
            repeat {
            guard let arrX = keyPair[arr[x]] else {return 0}
            guard let arrY = keyPair[arr[y]] else {return 0}

            if arrX > arrY && (!output.contains(arrX)){
                 output.append(arrX)
            }else if arrY > arrX {
                let str = "\(arrX)\(arrY)"
                
              if let kp =  keyPairInstances[str] {
                output.append(kp)
              }else {
                output.append(arrY - arrX)
              }
            }else {
                output.append(arrX)
            }
            x += 1
            y += 1
        
            }while(y < arr.count)
            print(output)
            let result = output.reduce(0,+)
            return result
            
        
        }
        
    }
}

let solution2 = SolutionRomanToInt()
let result = solution2.romanToInt("MCMXCIV")
