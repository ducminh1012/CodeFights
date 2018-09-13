import UIKit

func sortedSquaredArray(array: [Int]) -> [Int] {
    var r = array.count - 1
    var l = 0
    var res = [Int]()
    
    while r >= l {
        if abs(array[r]) > abs(array[l]) {
            res.append(array[r] * array[r])
            r -= 1
        } else {
            res.append(array[l] * array[l])
            l += 1
        }
    }
    return res.reversed()
}

sortedSquaredArray(array: [-6, -4, 1, 2, 3, 5])
