import UIKit

func makeArrayConsecutive2(statues: [Int]) -> Int {
    
    let a = statues.sorted()
    
    return a.last! - a.first! - a.count + 1
}

makeArrayConsecutive2(statues: [6, 2, 3, 8])
