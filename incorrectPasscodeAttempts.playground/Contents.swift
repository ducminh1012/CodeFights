import UIKit

func incorrectPasscodeAttempts(passcode: String, attempts: [String]) -> Bool {
    var failedCount = 0
    
    for pass in attempts {
//        while failedCount < 10 {
            if pass == passcode {
                failedCount = 0
            } else {
                failedCount += 1
                
                if failedCount > 9 {
                    return true
                }
            }
        
    }
    
    return failedCount > 9
}

incorrectPasscodeAttempts(passcode: "1111", attempts: ["1111", "4444",
                                                       "9999", "3333",
                                                       "8888", "2222",
                                                       "7777", "0000",
                                                       "6666", "7285",
                                                       "5555", "1111"])
