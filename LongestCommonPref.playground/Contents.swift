import UIKit

print("Running Longest common prefix")

func commonPrefixWithDict(of str1:String, and str2:String) -> String {
    var output = [String]()
    var dict1 = [Int:Character]()
    var pos1 = 0
    var dict2 = [Int:Character]()
    var pos2 = 0
    
    for str in str1 {
        dict1[pos1] = str
        pos1 += 1
    }
    print(dict1)
    
    for str in str2 {
        dict2[pos2] = str
        pos2 += 1

    }
    
    for a in str1 {
        
        for b in str2 {
            if a == b && !output.contains("\(a)") {
                output.append("\(a)")
            }
        }
    }
    return String("\(output)")
}

func commonPrefixWithArray(of str1:String, and str2:String) -> String {
    if str1.isEmpty { return "" }
    if str2.isEmpty { return "" }
    var output = [String]()
    for a in str1 {
        for b in str2 {
            if a == b && !output.contains("\(a)") {
                output.append("\(a)")
            }
        }
    }
    var res = ""
    for i in output {
        res += i
    }
    return res
}

var arr = ["ab","a"] //"flower","flow","flight"
//commonPrefixWithArray(of: "floral", and: "flow")

func commonPrefix(_ strs :[String]) -> String {
    
    if strs.count == 1 {
        return String("\(strs.first!)")
    }
    if strs.isEmpty { return "" }
    var result = ""
    let current = 0
    var next = 1
    result = commonPrefixWithArray(of:strs[current],and:strs[next])
    if result.isEmpty { return "" }
    repeat {
        next += 1
        result = commonPrefixWithArray(of:result,and:strs[next])
    }while(next < strs.count - 1)
    
    return String("\(result)")
}
let pr = commonPrefix(arr)



