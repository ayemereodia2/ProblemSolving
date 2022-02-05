import UIKit


func chessForRice(_ n: Int) -> Double {
    if n == 1 || n == 2 {
        return Double(n)
    }
    let left = chessForRice(n - 1)
    let right = chessForRice(n - 1)
    return Double((left) * (right))
}

chessForRice(7)
//16 * 16
