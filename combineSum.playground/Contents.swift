import UIKit

func combineSum(a: [Int], s: Int) -> (Int, Int) {

    var a = a.sorted(by: <)
    
    var l = 0
    var r = a.count - 1
    
    while l <= r {
        if a[l] + a[r] == s {
            return (a[l],a[r])
        } else if a[l] + a[r] < s {
            l += 1
        } else {
            r -= 1
        }
    }
    
    return (0,0)
}

let a = [4,5,7,3,2]
combineSum(a: a, s: 10)
