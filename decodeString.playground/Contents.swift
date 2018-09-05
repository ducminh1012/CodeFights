import UIKit

func decodeString(s: String) -> String {
    guard s.characters.count > 0 else { return "" }
    var array = Array(s.characters)
    var stack = [Character]()
    for i in 0 ..< array.count {
        let current = array[i]
        if current != "]" {
            stack.append(current)
        } else {
            var temp = [Character]()
            while stack.count > 0 && stack.last! != "[" {
                temp.insert(stack.removeLast(), at: 0)
            }
            stack.removeLast()
            var num = ""
            while stack.count > 0 && (stack.last! >= "0" && stack.last! <= "9") {
                num = String(stack.removeLast()) + num
            }
            for _ in 0 ..< Int(num)! {
                stack.append(contentsOf: temp)
            }
        }
    }
    return String(stack)
}

decodeString(s: "4[ab]")
