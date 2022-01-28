import UIKit


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        var largest = nums[0]
        var nextLarge = 0
        for val1 in 0..<nums.count {
            nextLarge = nums[val1]
            let pr = val1 + 1
            for val2 in pr..<nums.count {
                
                if nextLarge < 0 {
                    nextLarge = nums[val2]
                }else{
                    nextLarge = nextLarge + nums[val2]
                }
                
                if nextLarge > largest {
                    largest = nextLarge
               }
            }
            
             if nextLarge > largest {
                    largest = nextLarge
            }
        }
        return largest
    }
}


let pro = Solution()

let res = pro.maxSubArray([1])
