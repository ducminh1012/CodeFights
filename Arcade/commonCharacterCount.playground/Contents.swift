import UIKit

func commonCharacterCount(s1: String, s2: String) -> Int {
    var res = 0
    var s1 = Array(s1)
    var s2 = Array(s2)
    for i in 0..<s1.count {
        if s2.contains(s1[i]) {
            res += 1
            
            let index = s2.index(of: s1[i])!
            s2.remove(at: index)
        }
    }
    
    return res
}

commonCharacterCount(s1: "aabcc", s2: "adcaa")
