import UIKit



func climbStairs(_ n: Int) -> Int {
    let memo = Array(repeating: -1, count: n + 1)

    print(memo)
    return climber(n,memo)
}

func climber(_ n: Int, _ memo:[Int]) -> Int {
    var mem = memo
    if n == 1 || n == 2 {
        return n
    }else if mem[n] == -1 {
        mem[n] = climber(n-1, mem) + climber(n-2, mem)
    }
    /* 7 = 21
     6 = 13
     5 = 8
     4 = 5
     3 = 3
     2 = 2
     1 = 1*/
    return mem[n]
}

climbStairs(45)
