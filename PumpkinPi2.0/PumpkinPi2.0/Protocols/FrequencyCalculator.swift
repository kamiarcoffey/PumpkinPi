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

protocol CurrentCountCalculator: FrequencyCalculator {
    func calculateCurrentCount()  -> Int
}

protocol HourlyCalculator: FrequencyCalculator {
    // returns a day's worth of hour counts
    func calculateCountByHour()  -> [Double]
}

protocol DailyCalculator: FrequencyCalculator {
    // returns a weeks worth of day counts
    func calculateCountByDay()  -> [Double]
}

extension CurrentCountCalculator {
    
    
}

// https://firebase.google.com/docs/reference/ios/firebasedatabase/api/reference/Classes/FIRDatabaseQuery#a5d089e583013c7cdcd653f974e2cba56

extension HourlyCalculator {
    
    func calculateCountByHour()  -> [Double] {
        db.collection("carEvents") //.whereField("timeStamp", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
        return [Double](repeating: 24, count: 24)
    }
    
}



extension DailyCalculator {
    func calculateCountByDay()  -> [Double] {
        return [Double](repeating: 7, count: 7)
    }
}

protocol BasicDataCalculator: CurrentCountCalculator, HourlyCalculator, DailyCalculator {}
