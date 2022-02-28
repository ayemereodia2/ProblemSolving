import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var store = Array(repeating: 0, count: n + 1)
        store[0] = 0
        store[1] = 1
        store[2] = 2
        
        for i in 3...n {
        store[i] = store[i - 1] + store[i - 2]

        }
        return store[n]
  }

}
