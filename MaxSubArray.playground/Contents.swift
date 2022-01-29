import UIKit


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return maxSub(nums)
    }
    
    func maxSub(_ nums:[Int]) -> Int {
        
        let L = 0
        let R = nums.count
        
        if L == R { return nums[0] }
        
        let m = L + (R - L) / 2
        
        let l = maxSub(nums)
        let r = maxSub(nums)
        let c = maxCrossSubArray(nums,L,m,R)
        return max(l,r,c)
    }
    
    func maxCrossSubArray(_ nums:[Int], _ L:Int, _ m:Int, _ R: Int) -> Int {
        var leftSum = 0
        var rightSum = 0
        var curSum = 0
        for i in 0..<m {
            curSum += nums[i]
            leftSum = max(curSum,leftSum)
        }
        
        for i in m..<R {
            curSum += nums[i]
            rightSum = max(curSum,rightSum)
        }
        return max(leftSum,rightSum)
    }
}


let pro = Solution()

let res = pro.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
/*
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
 }
 */
