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

func isLucky(n: Int) -> Bool {
    let s = "\(n)"
    let half = s.index(s.startIndex, offsetBy: s.count / 2)
    let firstS = s.substring(to: half)
    let lastS = s.substring(from: half)
    let firstSum = firstS.reduce(0) { (res, char) -> Int in
        return res + Int(String(char))!
    }
    
    let lastSum = lastS.reduce(0) { (res, char) -> Int in
        return res + Int(String(char))!
    }

    return firstSum == lastSum
}

isLucky(n: 1234)

func sortByHeight(a: [Int]) -> [Int] {
    
    var t = a
    var b = a.sorted()
    var j = 0
    
    while j < a.count && b[j] < 0
    {
        j += 1
    }

    for i in 0..<a.count {
        if t[i] >= 0 {
            t[i] = b[j]
            j += 1
        }
    }
    
    return t
}

sortByHeight(a: [-1, 150, 190, 170, -1, -1, 160, 180])
