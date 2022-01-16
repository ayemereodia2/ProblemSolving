import UIKit

class SolutionRomanToInt {
    func romanToInt(_ s: String) -> Int {
        
        let arr = Array(s)
        let keyPair:[Character:Int] = ["I": 1, "V": 5, "X":10, "L":50, "C":100, "D": 500, "M":1000]
        let uniqueSet:Set<Character> = ["I","V","L","X","C","D","M"]
        
        if s.count >= 16 || s.count < 1  {
            return 0
        }else if s.count == 1 {
            for item in arr {
                if !uniqueSet.contains(item) {
                    return 0
                }
            }
            guard let single = keyPair[Character(s)] else { return 0}
            return single
        }
        else {
            for item in arr {
                if !uniqueSet.contains(item) {
                    return 0
                }
            }
            var output = 0
            var x = 0
            var y = 1
            repeat {
    
                guard let arrX = keyPair[arr[x]] else { return 0 }
                guard let arrY = keyPair[arr[y]] else {return 0 }
            
                if arrX > arrY {
                    output += arrX
                }else if arrY > arrX {
                    output -= arrX
                }else if arrY == arrX {
                    output += arrX
                }
                x += 1
                y += 1
                
            }while(y < arr.count)
            guard let last = keyPair[arr[arr.count - 1]] else { return 0 }
            output += last
            return output
            
        }
    }
}

let solution2 = SolutionRomanToInt()
let result = solution2.romanToInt("IV")
