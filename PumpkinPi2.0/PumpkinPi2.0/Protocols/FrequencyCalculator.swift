//
//  FrequencyCalculator.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/15/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

//===----------------------------------------------------------------------===//
//
//  This protocol defines the interface for ViewModels to format car data
//  into intervals that are disaplayed by week or by hour
//
//===----------------------------------------------------------------------===//


protocol FrequencyCalculator {
    var db: Firestore { get set }
}


protocol IntervalCalculator: FrequencyCalculator {
    
    var carEvents: [(Date, Bool)] { get set }
    func fetchCount(interval: Calendar.Component) -> [Double]
}


extension IntervalCalculator {
    
    func calculateCountByHour()  -> [Double] {
        return [Double](repeating: 24, count: 24)
    }
    
    
    func calculateCountByDay()  -> [Double] {
        return [Double](repeating: 7, count: 7)
    }
}
