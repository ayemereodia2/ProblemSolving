import UIKit


func validParantheses(_ s:String) -> Bool {
    
    if s.count < 1 {
        return false
    }
    var stack1 = [Character]()
    var stack2 = [Character]()
    
    for str in s {
        stack1.append(str)
    }


    for _ in s {
        let c = stack1.popLast()!
        if stack2.isEmpty {
            stack2.append(c)
        }else {
            let cv = stack2.popLast()!
            let validStr = "\(c)\(cv)"
            
            if validStr == "()" || validStr == "[]" || validStr == "{}" {
                
            }else{
                stack2.append(cv)
                stack2.append(c)
            }

        }

    }
    return stack2.count == 0
}

let res = validParantheses("([({})])")
