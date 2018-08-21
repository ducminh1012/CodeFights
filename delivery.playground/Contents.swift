import Foundation

func delivery(order: [Int], shoppers: [[Int]]) -> [Bool] {
    let res = shoppers.map { (shopper) -> Bool in
        (300 + 200) / 40 + 5
        let storeDistance = shopper.first!
        let speed = shopper[1]
        let idleTime = shopper[2]
        
        let homeDistance = order.first!
        let readyTime = order[1]
        let lateTime = order[2]
        
        let cal = Double(storeDistance + homeDistance) / Double(speed) + Double(idleTime)
        
        if cal >= Double(readyTime) && cal <= Double(readyTime + lateTime) {
            return true
        }
        
        return false
    }

    return res
}

delivery(order: [200, 20, 15], shoppers: [[300, 40, 5], [600, 40, 10]])

