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
func rotateImage2(image: [[Int]]) -> [[Int]] {
    var res = [[Int]](repeating: [0, 0, 0], count: image.count)
    
    for i in 0..<image.count {
        for j in 0..<image.count {
            res[i][j] = image[image.count - 1 - j][i]
        }
    }
    print(res.map({"\($0)"}).joined(separator: "\n"))
    return res
}

rotateImage2(image: [[1,2,3], [4,5,6], [7,8,9]])
