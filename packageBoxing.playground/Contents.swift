import UIKit
func packageBoxing(pkg: [Int], boxes: [[Int]]) -> Int {
    
    let pkg = pkg.sorted()
    var min = Int.max
    var result = -1
    for (i,box) in boxes.enumerated() {
        let box = box.sorted()
        print(box)
        if pkg[0] <= box[0] && pkg[1] <= box[1] && pkg[2] <= box[2] {
            
            let size = box[0] * box[1] * box[2]
            //            print(size)
            if size < min {
                result = i
                min = size
            }
            print(min)
        }
        
    }
    
    
    return result
}

packageBoxing(pkg: [4, 4, 2], boxes: [[2,4,4],
                                      [4,4,3]])
