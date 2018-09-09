import UIKit

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
    for i in 0..<totalPartial {
        
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

//a.forEach { (s) in
//    print(s.count)
//}
