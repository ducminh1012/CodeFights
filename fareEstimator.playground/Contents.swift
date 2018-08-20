import UIKit

func fareEstimator(ride_time: Int, ride_distance: Int, cost_per_minute: [Double], cost_per_mile: [Double]) -> [Double] {
    let costPerTime = cost_per_minute.map { (cost) -> Double in
        return cost * Double(ride_time)
    }
    
    let costPerDistance = cost_per_mile.map { (cost) -> Double in
        return cost * Double(ride_distance)
    }
    
    let res = zip(costPerTime, costPerDistance).map(+)
    
    return res
}

fareEstimator(ride_time: 30, ride_distance: 7, cost_per_minute: [0.2, 0.35, 0.4, 0.45], cost_per_mile: [1.1, 1.8, 2.3, 3.5])
