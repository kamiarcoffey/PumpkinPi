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
    
    func calculateCurrentCount()  -> Int {
        print("idk why its not fetching")
        var returnData = 0
        db.collection("cameraData").document("realTime").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            print("Current data: \(data)")
            returnData = data.count
        }
        return returnData
    }
}

extension HourlyCalculator {
    
    func calculateCountByHour()  -> [Double] {
        db.collection("carEvents").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                //                returnVals = querySnapshot!.documents.map{ $0.data() as Double }
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
