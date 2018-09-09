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
