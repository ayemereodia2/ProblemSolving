import UIKit

func binarySearch<T:Comparable>(a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    
    while lowerBound < upperBound {
        let mid = lowerBound + (upperBound - lowerBound) / 2
        
        if a[mid] == key {
            return mid
        }else if a[mid] < key {
            lowerBound = mid + 1
        }else {
            upperBound = mid
        }
    }
    return nil
}
