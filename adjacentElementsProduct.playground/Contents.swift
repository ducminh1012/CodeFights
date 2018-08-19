import UIKit

func adjacentElementsProduct(inputArray: [Int]) -> Int {
    var p = inputArray[0] * inputArray[1]
    
    for i in 0..<inputArray.count - 1 {
        if inputArray[i] * inputArray[i+1] > p {
            p = inputArray[i] * inputArray[i+1]
        }
        
    }
    
    return p
}

adjacentElementsProduct(inputArray: [3, 6, -2, -5, 7, 3])
