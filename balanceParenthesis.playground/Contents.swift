import UIKit

func checkParenthesis(str: String) -> Bool {
    
    let arr = Array(str)
    var stack = [Character]()
    for c in arr {
        if c == "(" || c == "[" || c == "{" {
            stack.append(c)
        }
        print(stack)
        if c == ")" || c == "]" || c == "}" {
            if stack.isEmpty {
                return false
            }
            let p = stack.popLast()
            
            if !checkPair(char1: String(p!), char2: String(c)) {
                return false
            }
        }
    }
    
    if !stack.isEmpty {
        return false
    }
    return true
}

func checkPair(char1: String, char2: String) -> Bool {
    if (char1 == "(" && char2 == ")") {
        return true
    }
    else if (char1 == "{" && char2 == "}") {
        return true
    }
    else if (char1 == "[" && char2 == "]") {
        return true
    }
    else {
        return false
    }
}

checkParenthesis(str: "[(([]))]")
