class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
    if strs.count == 1 {
        return String("\(strs.first!)")
    }
    guard !strs.isEmpty else { return "" }
    var result = ""
    let current = 0
    var next = 1
     if strs.count == 2 {
        result = commonPrefixWithArray(of:strs[current],and:strs[next])
        return result
    }
    result = commonPrefixWithArray(of:strs[current],and:strs[next])
    if result.isEmpty { return "" }
    repeat {
        next += 1
        result = commonPrefixWithArray(of:result,and:strs[next])
    }while(next < strs.count - 1)
    
    return result
}
    
  func commonPrefixWithArray(of str1:String, and str2:String) -> String {
    if str1.isEmpty { return "" }
    if str2.isEmpty { return "" }
    var output = [String]()
    var nextpos = 0
        for (index,a) in str1.enumerated() {
            for (indexv,b) in str2.enumerated() {
                if a == b && index == nextpos && index == indexv {
                    output.append("\(a)")
                    nextpos += 1
                }
            }
        }
    var res = ""
    for i in output {
        res += i
    }
    return res
  }
}

let result = Solution()
let prefix = result.longestCommonPrefix(["aa","ab"])
