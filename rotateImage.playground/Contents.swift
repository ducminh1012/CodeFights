import UIKit

// In-place
func rotateImage(image: [[Int]]) -> [[Int]] {
    var image = image
    for i in 0..<(image.count / 2) {
        
        let first = i
        let last = image.count - 1 - i
        
        for j in first..<last {
            
            let offset = j - first
            let top = image[first][i]

            image[first][j] = image[last-offset][first]
            
            // bottom -> left
            image[last-offset][first] = image[last][last - offset]
            // right -> bottom
            image[last][last - offset] = image[j][last]
            
            // top -> right
            image[i][last] = top
            // right <- saved top
        }
    }
    
    return image
}

// With additional space
func rotateImage2(a: [[Int]]) -> [[Int]] {
    var res = [[Int]](repeating: [Int](repeating: 0, count: a.count), count: a.count)
    
    for i in 0..<a.count {
        for j in 0..<a[i].count {
            res[i][j] = a[a.count - 1 - j][i]
        }
    }
    print(res.map({"\($0)"}).joined(separator: "\n"))
    return res
}

//rotateImage2(a: [[33,35,8,24,19,1,3,1,4,5],
//                      [25,27,40,25,17,35,20,3,19,3],
//                      [9,1,9,30,9,25,32,12,15,22],
//                      [30,47,25,10,18,1,19,17,43,17],
//                      [40,46,42,34,18,48,29,40,31,39],
//                      [37,42,37,19,45,1,4,46,48,13],
//                      [8,26,31,46,44,24,34,29,12,25],
//                      [45,48,36,12,33,12,4,45,22,37],
//                      [33,15,34,25,34,8,50,48,30,28],
//                      [18,19,22,29,15,43,38,30,8,47]])

func groupingDishes(dishes: [[String]]) -> [[String]] {
    var ingredients = [String: Set<String>]()
    
    for i in 0..<dishes.count {
        let dish = dishes[i].first
            
        for j in 0..<dishes[i].count {
            let key = dishes[i][j]
            if var newDish = ingredients[key] {
                newDish.insert(dish!)
                ingredients[key] = newDish
            } else {
            
                ingredients[key] = Set([dish!])
            }
        }
    }
//    print(ingredients.filter({$0.value.count > 1}))
    var res = [[String]]()
    for r in ingredients.filter({$0.value.count > 1}) {
        var arr = [String]()
//        arr.append(r.key)
        arr.append(contentsOf: r.value)
        arr.sort{ (v1, v2) -> Bool in
            return v1 > v2
        }
        arr.insert(r.key, at: 0)
        res.append(arr)
        
//        print(r.key)
    }
//
    res.sort { (v1, v2) -> Bool in
        return v1[0] < v2[0]
    }
//
    print(res)
    return res
}

func quickSort(a: [Int], l: Int, r: Int) -> [Int] {
    var arr = a
    quickSortRef(a: &arr, l: l, r: r)
    return arr
}

func quickSortRef(a: inout [Int], l: Int, r: Int) -> Void {
    
    if l >= r {
        return
    }
    
    let x = a[l]
    var i = l
    var j = r
    
    while i <= j {
        while a[i] < x {
            i += 1
        }
        while a[j] > x {
            j -= 1
        }
        if i <= j {
            let t = a[i]
            a[i] = a[j]
            a[j] = t
            i += 1
            j -= 1
        }
    }
    
    quickSortRef(a: &a, l: i+1, r: j-1)
}

//quickSort(a: [5, 2, 1, 7, 5, 3, 2, 3], l: 0, r: 7)

//func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
//    let pivot = a[low]
//    var i = low - 1
//    var j = high + 1
//
//    while true {
//        repeat { j -= 1 } while a[j] > pivot
//        repeat { i += 1 } while a[i] < pivot
//
//        if i < j {
//            a.swapAt(i, j)
//        } else {
//            return j
//        }
//    }
//}
//
//func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
//    if low < high {
//        let p = partitionHoare(&a, low: low, high: high)
//        quicksortHoare(&a, low: low, high: p)
//        quicksortHoare(&a, low: p + 1, high: high)
//    }
//}
//var a = [5, 2, 1, 7, 5, 3, 2, 3]
//quicksortHoare(&a, low: 0, high: a.count - 1)

func higherVersion2(ver1: String, ver2: String) -> Int {
    let v1 = ver1.components(separatedBy: ".").map({Int($0) ?? 0})
    let v2 = ver2.components(separatedBy: ".").map({Int($0) ?? 0})
    
    var res = 0
    
    for i in 0..<v1.count {
        print(v1[i])
        if v1[i] == v2[i] && i == v1.count - 1{
            res = 0
        } else if v1[i] > v2[i] {
            res = 1
            break
        } else if v1[i] < v2[i] {
            res = -1
            break
        }
    }
    
    return res
}

//higherVersion2(ver1: "1.0.5", ver2: "1.1.0")

func sortByString(s: String, t: String) -> String {
    var res = ""
    
    
    for c in t {
        for a in s {
//            print(a)
            if c == a {
            res += String(c)
            }
        }
    }
    return res
}

//sortByString(s: "weather", t: "therapyw")
