import UIKit

class Solution {
    func isPalindrome(_ x: Int) -> Bool {

        var num1 = x
        var arr1 = [Int]()

        repeat {
            arr1.append(num1 % 10)
            num1 = num1 / 10
        }while(num1 != 0)

        var myString = ""
        _ = arr1.map { myString = myString + "\($0)"}

        let intString = Int(myString) ?? 0

        if intString == x && intString >= 0 {
            return true
        }
        return false
    }
}

let solution = Solution()
let pal = solution.isPalindrome(10001)
