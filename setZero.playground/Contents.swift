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

setZero(matrix: [[1,2,0], [4,5,6], [7,8,9]])
