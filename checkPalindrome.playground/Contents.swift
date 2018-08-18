import UIKit

func checkPalindrome2(inputString: String) -> Bool {
    var l = 0
    var r = inputString.count - 1
    
    while l < r {
        if inputString[inputString.index(inputString.startIndex, offsetBy: l)] == inputString[inputString.index(inputString.startIndex, offsetBy: r)] {
            l += 1
            r -= 1
        } else{
            return false
        }
    }
    
    return true
}

func checkPalindrome3(inputString: String) -> Bool {
    let r = inputString.count - 1
   
    for i in 0..<r/2 {
        if inputString[inputString.index(inputString.startIndex, offsetBy: i)] != inputString[inputString.index(inputString.startIndex, offsetBy: r - 1 - i)] {
            return false
        }
    }
    
    return true
}

func checkPalindrome(inputString: String) -> Bool {
    var a = inputString.characters.map { "\($0)" },
                                       p = a.count
    for i in 0..<(p / 2) {
        if a[i] != a[p - i - 1] {
            return false
        }
    }
    return true
}

checkPalindrome(inputString: "abac")
