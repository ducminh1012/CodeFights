import UIKit

// 1
func amendTheSentence(s: String) -> String {
    var arr = [String]()
    for char in s {
        if char >= "A" && char <= "Z" {
            arr.append(" ")
        }
        arr.append(String(char))
    }
    if arr.first == " " {
        arr.removeFirst()
    }
    
    return arr.joined(separator: "").lowercased()
}

extension Character {
    var isUppercase: Bool { return String(self).uppercased() == String(self) }
}

let text = "HelloWorld"

let indexes = Set(text
    .enumerated()
    .filter { $0.element.isUppercase }
    .map { $0.offset })

let chunks = text
    .map { String($0) }
    .enumerated()
    .reduce([String]()) { chunks, elm -> [String] in
        guard !chunks.isEmpty else { return [elm.element] }
        guard !indexes.contains(elm.offset) else { return chunks + [String(elm.element)] }
        
        var chunks = chunks
        chunks[chunks.count-1] += String(elm.element)
        return chunks
}
