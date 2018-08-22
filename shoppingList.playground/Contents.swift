import UIKit

func shoppingList(items: String) -> Double {
    let regex = "\\d+\\.?\\d+"
    
    let dateRegex = try! NSRegularExpression(pattern: regex,
                                             options: [])
    let matches = dateRegex.matches(in: items, options: [], range: NSRange(location: 0, length: items.count))
    print(matches)
    
    let res = matches.map ({
        Double(items[Range($0.range, in: items)!])!
    }).reduce(0, +)
    
    
    
    return res
}

shoppingList(items: "Doughnuts, 4; doughnuts holes, 0.08; glue, 3.4")
