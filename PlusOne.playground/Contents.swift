import UIKit

func plusOne(_ digits: [Int]) -> [Int] {
    var temp = digits
    var conv = [1]
    
    for i in (0..<digits.count).reversed() {

        repeat {
            if let popped = conv.popLast() {
                
                let lastYet = digits[i] + popped
                if lastYet <= 9 {
                    temp.remove(at:i)
                    temp.insert(lastYet, at:i)
                    
                }else{
                    conv = intToArray(sum:lastYet)
                    if let last = conv.popLast() {
                        temp.remove(at:i)
                        temp.append(last)
                    }
                }
            }
        }while(conv.count > 1)
    }
    if conv.count == 1 {
        temp.insert(conv[0], at:0)
    }
    return temp
  }
  
  func intToArray(sum:Int) -> [Int] {
      var editSum = sum
      var result = [Int]()
        result.append(editSum%10)
        while editSum >= 10 {
        editSum = editSum / 10
        result.insert(editSum%10, at:0)
      }
      return result
  }

let val = plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])

//[7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]
