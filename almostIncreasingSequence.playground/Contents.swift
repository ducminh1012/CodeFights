import UIKit

func isStrictlyIncreasing(a: [Int]) -> Bool {
    for i in 0..<(a.count-1) {
        if a[i] >= a[i+1] {
            return false
        }
    }
    return true
}

func almostIncreasingSequence(sequence: [Int]) -> Bool {
    
    var a = sequence
    
    if isStrictlyIncreasing(a: a) {
        return true
    }
    
    var shouldRemoveIndex = [Int]()
    
    for i in 0..<a.count - 1 {
        if a[i] >= a[i+1] {
            shouldRemoveIndex += [i,i + 1]
            break
        }
    }
    //    print(shouldRemoveIndex)
    for i in 0..<shouldRemoveIndex.count {
        a.remove(at:shouldRemoveIndex[i])
        if isStrictlyIncreasing(a: a) {
            return true
        }
    }
    
    return false
}

almostIncreasingSequence(sequence: [10, 1, 2, 3, 4, 5])
