import UIKit

func sumInRange(nums: [Int], queries: [[Int]]) -> Int {
    var sum: Double = 0
    for q in queries {
        for value in nums[q.first!...q.last!] {
            sum += Double(value)
        }
    }

    let r: Double = pow(10, 9) + 7

    return Int(r.truncatingRemainder(dividingBy: sum))
}

let a = [-4, -18, -22, -14, -33, -47, -29, -35, -50, -19]
sumInRange(nums: a, queries: [[2,9],
           [5,6],
           [1,2],
           [2,2],
           [4,5]])
