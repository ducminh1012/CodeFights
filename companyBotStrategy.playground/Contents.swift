import UIKit

func companyBotStrategy(trainingData: [[Int]]) -> Double {
    let filterData = trainingData.filter({$0[1] == 1})
    
    guard !filterData.isEmpty else { return 0}
    return Double(filterData.reduce(0, { (result, value) -> Int in
        return result + value[0]
    })) / Double(filterData.count)
}

//companyBotStrategy(trainingData: [[4, -1],
//                                  [0, 0],
//                                  [5, -1]])

func marathonTaskScore(marathonLength: Int, maxScore: Int, submissions: Int, successfulSubmissionTime: Int) -> Int {
    
    guard successfulSubmissionTime > 0 else { return 0 }
    
    let halfScore = maxScore / 2
    
    let res = Double(submissions - 1) * 10 + Double(successfulSubmissionTime) * (Double(maxScore) / 2) * (1 / Double(marathonLength))
    return max(halfScore, maxScore - Int(res))
}

//marathonTaskScore(marathonLength: 100, maxScore: 400, submissions: 4, successfulSubmissionTime: 30)

func isAdmissibleOverpayment(prices: [Double], notes: [String], x: Double) -> Bool {

    var storePrice = [Double]()
    for i in 0..<notes.count {
        if notes[i].components(separatedBy: " ").first == "Same" {
            storePrice.append(prices[i])
        } else {
            let percent = Double(notes[i].components(separatedBy: "%").first!)!
            let shouldInscrease = notes[i].components(separatedBy: " ")[1] == "lower"
            
            let price = shouldInscrease ? prices[i] / (100 - percent) * 100 : prices[i] / (100 + percent) * 100
            storePrice.append(price)
        }
    }
    
    let sum = zip(prices, storePrice).map(-).reduce(0, +)
    
    print(storePrice)
    return sum <= x
}

//isAdmissibleOverpayment(prices: [48, 165], notes: ["20.00% lower than in-store",
//                                                         "10.00% higher than in-store"], x: 2)

func domainType(domains: [String]) -> [String] {
    let a = domains.map { (str) -> String in
        return organization(s: str)
    }
    
    return a
}

func organization(s: String) -> String {
    let a = s.components(separatedBy: ".")
    switch a.last! {
    case "org":
        return "organization"
    case "com":
        return "commercial"
    case "net":
        return "network"
    case "info":
        return "information"
    default:
        return ""
    }
}

//domainType(domains: ["en.wiki.org", "codesignal.com", "happy.net", "code.info"])
