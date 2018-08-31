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
