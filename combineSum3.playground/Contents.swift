import UIKit

func combineSum3(arr: [Int], sum: Int) -> [Int] {
    var result = [Int]()
    var hashMap = [Int: Int]()

    for (index, value) in arr.enumerated() {
        let complement = sum - value
        
        if let v = hashMap[complement] {
            result.append(v)
            result.append(index)
        } else {
            hashMap[value] = index
        }
    }
    
    return result
}

combineSum3(arr: [5, 7, 5, 2, 11, 15], sum: 9)
