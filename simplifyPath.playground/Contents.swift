import UIKit

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
