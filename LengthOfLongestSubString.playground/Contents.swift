import UIKit


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arr = Array(s)
        var j = 0
        var i = 0
        var unique = Set<Character>()
        var max1 = 0
        while(i < arr.count) {
            while unique.contains(arr[i]){
                unique.remove(arr[j])
                j += 1
            }
            unique.insert(arr[i])
            max1 = max(max1, i-j+1)
            i += 1
        }
       
        return max1
    }
}

let sol = Solution()

let result = sol.lengthOfLongestSubstring("pwwkew")
