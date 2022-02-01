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
        var rightSum = nums[m]
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

let res = pro.maxSubArray([0,-3,1,1])
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
    var curSum = 0
    
    let L = 0
    let R = nums.count
        
    let m = L + (R - L) / 2
    
    var leftSum = nums[m]
    var rightSum = nums[m]
    
    for i in (0..<m).reversed() {
//        if i == m - 1{
//            leftSum = nums[i]
//        }
        curSum += nums[i]
        leftSum = max(curSum,leftSum)
        print("leftSum is ",leftSum)
    }
    curSum = 0
    for i in m..<R {
//        if i == m {
//            rightSum = nums[i]
//        }
        curSum += nums[i]
        rightSum = max(curSum,rightSum)
        print("rightSum is ",rightSum)
    }
    return (leftSum + rightSum)
}

//let result = maxCrossSubArray([-2,1,-3,4,-1,2,1,-5,4])



/*
 kadane algorithm
 explanation???
 
 class Solution {
     func maxSubArray(_ nums: [Int]) -> Int {
            var current = 0, best = 0, maximum = nums.first ?? 0
         for num in nums {
             maximum = max(maximum, num)
             current = max(0, current + num)
             best = max(best, current)
         }
         if maximum <= 0 {
             return maximum
         } else {
             return best
         }
     }
      
 }
 */
