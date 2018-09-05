import UIKit

func matrixElementsSum(matrix: [[Int]]) -> Int {
    var matrix = matrix
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if (matrix[i][j] == 0 && i < matrix.count - 1) {
                matrix[i+1][j] = 0
                print(i)
            }
        }
    }
    
    return matrix.flatMap({$0}).reduce(0, +)
}

matrixElementsSum(matrix: [[0]])

func allLongestStrings(inputArray: [String]) -> [String] {
    var a = 0
    
    inputArray.forEach { (s) in
        if s.count > a {
            a = s.count
        }
    }
    
    a
    let max = inputArray.filter { (input) -> Bool in
        return input.count == a
    }
    
    return max
}

allLongestStrings(inputArray: ["aba", "aa", "ad", "vcd", "aba"])

//func commonCharacterCount(s1: String, s2: String) -> Int {
////    int[] a = new int[26];
////    int[] b = new int[26];
////    for (char c: s1.toCharArray())
////        a[c - 'a']++;
////    for (char c: s2.toCharArray())
////        b[c - 'a']++;
////    int s = 0;
////    for (int i = 0; i < 26; ++i)
////    s +=Math.min(a[i],b[i]);
////    return s;
//
//    var a = [Int](repeating: 0, count: 26)
//    var b = [Int](repeating: 0, count: 26)
//
//    for char in s1.characters {
//        a[char.unicodeScalars.first?.value - "a".unicodeScalars.first?.value] += 1
//    }
//}
//
//commonCharacterCount(s1: "aabcc", s2: "adcaa")

func allianceHelp(t: Int, allianceSize: Int) -> Int {
    let alliance = min(allianceSize, 10)
    
    let cal = max(60, t * 10 / 100)
    let res = t - alliance * cal
    return max(res,0)
}

//allianceHelp(t: 100, allianceSize: 10)

func ratingThreshold(threshold: Double, ratings: [[Int]]) -> [Int] {
    var a = [Int]()
    let average = ratings.map { (rating) -> Double in
        return Double(rating.reduce(0, +)) / Double(rating.count)
    }
    
    for (i,r) in average.enumerated() {
        if r < threshold {
            a.append(i)
        }
    }
    
    return a
}

//ratingThreshold(threshold: 3.5, ratings: [[3, 4],
//                                                    [3, 3, 3, 4],
//                                                    [4]])

func priceSuggestion(contractData: [Int]) -> [Int] {
    let a = contractData.sorted()
    
    let mid = a.count / 2
    
    let averageA = Double(Array(a[0..<mid]).reduce(0, +)) / Double(mid)
    
    let averageB = Double(Array(a[mid...]).reduce(0, +)) / Double(mid)
    
    let lower = a.firstIndex { (n) -> Bool in
        return Double(n) >= averageA
    }
    
    let upper = a.firstIndex { (n) -> Bool in
        return Double(n) >= averageB
    }
    
    return [a[lower!], a[upper!]]
}

//priceSuggestion(contractData: [10, 15, 14, 7, 11, 15])

func kthLargestElement(nums: [Int], k: Int) -> Int {
//    if k > nums.count {
//        return nums[0]
//    }
//
//    print(nums.sorted(by: >))
//    return nums.sorted(by: >)[k - 1]
    
    let len = nums.count
    if k > 0 && k <= len {
        let sorted = nums.sorted()
        return sorted[len - k]
    } else {
        return 0
    }
}

//kthLargestElement(nums: [2,1], k: 2)

func textJustification(words: [String], l: Int) -> [String] {
    var text = ""
    var res = [String]()
    var words = words
    var i = 0
    
    while words.count > 0 {
        if text.count < l {
            //            print(text.count)
            text += " \(words[i])"
            
        } else {
            res.append(text)
            text = ""
            print(text)
        }
        
        words.remove(at: i)
        i += 1
    }
    
    res.append(text)
    
    print(res)
    
    return res
}

//textJustification(words: ["This", "is", "an", "example", "of", "text", "justification."], l: 16)

 public class Tree<T> {
     public var value: T
     public var left: Tree<T>?
     public var right: Tree<T>?
     public init(_ x: T) {
         self.value = x
         self.left = nil
         self.right = nil
     }
 }
var res = [Int]()
func traverseTree(t: Tree<Int>?) -> [Int] {
    
    if let v = t?.value {
        res.append(v)
    }
    
    if t?.left == nil && t?.right == nil {
        return res
    }
    traverseTree(t:t?.left)
    
    traverseTree(t:t?.right)
    
    return res
}

func simplifyPath(path: String) -> String {
    let dirs = path.components(separatedBy: "/")
    var stack = [String]()
    
    for dir in dirs {
        if dir == "." {
            continue
        } else if dir == ".." {
            if !stack.isEmpty {
                stack.removeLast()
            }
        } else {
            if dir != "" {
                stack.append(dir)
            }
        }
    }
    
    let res = stack.reduce("") { total, dir in "\(total)/\(dir)" }
    
    return res.isEmpty ? "/" : res
}

simplifyPath(path: "/home/a/./x/../b//c/")
