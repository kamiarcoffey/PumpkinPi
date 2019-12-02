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


protocol FrequencyCalculator {
    var db: Firestore { get set }
}


protocol IntervalCalculator: FrequencyCalculator {
    
    var carEvents: [(Date, Bool)] { get set }
    func fetchCount(interval: Calendar.Component) -> [Double]
}



//https://firebase.google.com/docs/reference/ios/firebasedatabase/api/reference/Classes/FIRDatabaseQuery#a5d089e583013c7cdcd653f974e2cba56

extension IntervalCalculator {
    
    func calculateCountByHour()  -> [Double] {
        return [Double](repeating: 24, count: 24)
    }
    
    
    func calculateCountByDay()  -> [Double] {
        return [Double](repeating: 7, count: 7)
    }
}
