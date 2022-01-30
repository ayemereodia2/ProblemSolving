import UIKit


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return maxSub(nums,0,nums.count - 1)
    }
    
    func maxSub(_ nums:[Int], _ L:Int, _ R:Int) -> Int {
        if L == R { return nums[L] }
        let m = L + (R - L) / 2

            
        let l = maxSub(nums,L,m)
        let r = maxSub(nums,m+1,R)
        let c = maxCrossSubArray(nums,L,m,R)
        return max(l,r,c)
    }
    
    
    func maxCrossSubArray(_ nums:[Int], _ L:Int, _ m:Int, _ R: Int) -> Int {
        var leftSum = 0
        var rightSum = 0
        var curSum = 0
        
        for i in (0..<m).reversed() {
            curSum += nums[i]
            leftSum = max(curSum,leftSum)
        }
        curSum = 0
        for i in m...R {
            curSum += nums[i]
            rightSum = max(curSum,rightSum)
        }
        print(leftSum, rightSum)
        return (leftSum + rightSum)
    }
    
}


let pro = Solution()

let res = pro.maxSubArray([5,4,-1,7,8])
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

func maxCrossSubArray(_ nums:[Int]) -> Int {
    var leftSum = 0
    var rightSum = 0
    var curSum = 0
    
    let L = 0
    let R = nums.count
        
    let m = L + (R - L) / 2
    
    for i in (0..<m).reversed() {
        curSum += nums[i]
        leftSum = max(curSum,leftSum)
        print("leftSum is ",leftSum)
    }
    curSum = 0
    for i in m..<R {
        curSum += nums[i]
        rightSum = max(curSum,rightSum)
        print("rightSum is ",rightSum)
    }
    return (leftSum + rightSum)
}

//let result = maxCrossSubArray([5,4,-1,7,8])
