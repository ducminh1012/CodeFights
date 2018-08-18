//TODO Improve
func findFirstSubstringOccurrence2(s: String, x: String) -> Int {
    let sCount = s.characters.count
    let xCount = x.characters.count
    
    for (index,char) in s.characters.enumerated() {
        
        if x.characters.first == char {
            if index <= sCount - xCount {
                let start = s.index(s.startIndex, offsetBy: index)
                let end = s.index(s.startIndex, offsetBy: index + xCount - 1)
                
                let sub = s[start...end]
                if sub == x {
                    print(sub)
                    return index
                }
            }
        }
    }
    return -1
}

func findFirstSubstringOccurrence(s: String, x: String) -> Int {
    var j = 0
    for i in 0...s.characters.count - x.characters.count - 1 {
        let char = s.characters.[i]
        if x.characters.first == char {
            if index <= sCount - xCount {
                let start = s.index(s.startIndex, offsetBy: index)
                let end = s.index(s.startIndex, offsetBy: index + xCount - 1)
                
                let sub = s[start...end]
                if sub == x {
                    print(sub)
                    return index
                }
            }
        }
    }
}

let a = "GTgpEYIWKIWrlEtByHryETrBeTWNkHutWKOCvVNRSGSxaynjzTatJMKSwCLSCZObaNNGCXQssfEEDDJIPBwtkMmTniKaKfqaOtvO"
let b = "vCLSCZObaNNGCXQssfEEDDJIPBwtkMmTniKa"

findFirstSubstringOccurrence(s: a, x: b)
