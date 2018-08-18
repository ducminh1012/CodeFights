import UIKit

func singleNumber(nums: [Int]) -> Int {
    var res = 0
    for num in nums {
        res = num ^ res
    }
    res
    return res
}

singleNumber(nums: [1, 3, 1, -1, 3])

var a = 10
var b = a ^ 2
