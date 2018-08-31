import UIKit

func setZero(matrix: [[Int]]) -> [[Int]] {
    var matrix = matrix
    print(matrix.map({"\($0)"}).joined(separator: "\n"))
    var row = [Int](repeating: 0, count: matrix.count)
    var column = [Int](repeating: 0, count: matrix[0].count)
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if (matrix[i][j] == 0) {
                row[i] = 1
                column[j] = 1
            }
        }
    }
    row
    column
    print("\n\n")
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if (row[i] == 1 || column[j] == 1) {
                matrix[i][j] = 0
            }
        }
    }
    print(matrix.map({"\($0)"}).joined(separator: "\n"))
    return matrix
}

//setZero(matrix: [[1,2,0], [4,5,6], [7,8,9]])

func incrementalBackups(lastBackupTime: Int, changes: [[Int]]) -> [Int] {
    let needBackups = changes.filter({$0[0] > lastBackupTime})
    let a = needBackups.map({ (change) -> Int in
        return change[1]
    })
    let res: Set = Set(a)
    
    return Array(res).sorted()
}

//incrementalBackups(lastBackupTime: 461620205, changes: [[461620203, 1],
//                                                         [461620204, 2],
//                                                         [461620205, 6],
//                                                         [461620206, 5],
//                                                         [461620207, 3],
//                                                         [461620207, 5],
//                                                         [461620208, 1]])


func tasksTypes(deadlines: [Int], day: Int) -> [Int] {
    let res = deadlines.map { (dead) -> String in
        let delta = dead - day
        if delta <= 0 {
            return "Today"
        } else if delta <= 7 {
            return "Upcoming"
        } else {
            return "Later"
        }
        
    }
    
    let today = res.filter({$0 == "Today"})
    let upcoming = res.filter({$0 == "Upcoming"})
    let later = res.filter({$0 == "Later"})
    
    print(res)
    return [today.count, upcoming.count, later.count]
}

//tasksTypes(deadlines: [1, 2, 3, 4, 5], day: 2)

func smartAssigning(names: [String], statuses: [Bool], projects: [Int], tasks: [Int]) -> String {
    
    var res = zip(names, zip(statuses, zip(projects, tasks))).map { (arg0) -> (String, Bool, Int, Int) in
        
        let (n, (s, (p, t))) = arg0
        return (n,s,p,t)
    }
    
    res = res.filter({ (n, s, p, t) -> Bool in
        return s == false
    })
    
    res.sort { (arg0, arg1) -> Bool in
        
        let (n1, s1, p1, t1) = arg0
        let (n2, s2, p2, t2) = arg1
        if t1 != t2 {
            return t1 < t2
        }
        return p1 < p2
    }

    return res.first!.0
}

//smartAssigning(names: ["John", "Martin"], statuses: [false, false], projects: [2, 1], tasks: [16, 5])


func split(_ input: String, limit: Int) -> [String] {
    
    // Remove redudant white space and lines
    let components = input.components(separatedBy: .whitespacesAndNewlines)
    let filterMessage = components.filter { !$0.isEmpty }.joined(separator: " ")
    
    // Return message if its length is less than or equal limit
    if (filterMessage.count <= limit) {
        return [filterMessage]
    }
    
    // Calculate total partial
    let totalPartial: Int = (filterMessage.count / limit) + (filterMessage.count % limit > 0 ? 1 : 0)
    
    // Separate sentences into words by remove whitespaces and new lines
    let words = filterMessage.components(separatedBy: .whitespacesAndNewlines)
    
    // Check error, if available words have length that greater than limit
    let errorWords = words.filter { return $0.count > limit }
    
    // Return error if the length is great than limit and contains non-whitespace
    if !errorWords.isEmpty {
        return ["The message contains a span of non-whitespace characters longer than \(limit) characters"]
    }
    
    // Return message
    return conbinePartial(words, totalPartial: totalPartial, limitCharacters: limit)
}


func conbinePartial(_ words: [String], totalPartial: Int, limitCharacters: Int) -> [String] {
    
    var results:[String] = []
    var lastCurrentIndex = 0 // Use to keep track the word index when appeding to partial
    
    // Loop by partial step
    for i in 0...totalPartial - 1 {
        
        // Init partial content for every step
        var partial = "\(i + 1)/\(totalPartial) "
        
        // For every step, we append the words, keep track current index and count the length of partial
        // If the partial length is equal or over the limit characters, we stop and move to another partial step
        let nextStepIndex = lastCurrentIndex + (i != 0 && lastCurrentIndex < words.count - 1 ? 1:0)
        for index in nextStepIndex...words.count - 1 {
            
            // Get Item
            let item = words[index]
            
            // Break loop if length is over than limit
            // (+ 1 because the last whitespace before trimming)
            let length = partial.count + item.count + 1
            if (length > limitCharacters + 1) {
                break;
            }
            
            // Append word to partial
            partial += item + " "
            
            // Store current index to know the last word
            lastCurrentIndex = index
        }
        
        // Add to results
        results.append(partial.trimmingCharacters(in: .whitespaces))
        
    }
    
    //Applied recursive to re-calculate total partials
    if lastCurrentIndex < words.count - 1 {
        let total = totalPartial + 1
        results = conbinePartial(words, totalPartial: total, limitCharacters: limitCharacters)
    }
    
    return results
}

let a = split("I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself.", limit: 50)

a.forEach { (s) in
    print(s.count)
}
