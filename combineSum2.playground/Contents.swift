import UIKit

func combineSum2(arr: [Int], sum: Int) -> [Int] {
    var result = [Int]()
    var hashMap = [Int: Int]()
    
    for (index, value) in arr.enumerated() {
        hashMap[value] = index
    }
    
    for (index, value) in arr.enumerated() {
        let complement = sum - value
        if let exist = hashMap[complement], exist != index {
            result.append(index)
            result.append(exist)
            
            return result
        }
    }
    
    return result
}

combineSum2(arr: [5, 7, 5, 2, 11, 15], sum: 9)
