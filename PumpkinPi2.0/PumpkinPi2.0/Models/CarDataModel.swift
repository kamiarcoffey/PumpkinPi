//
//  CarDataModel.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 12/1/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class CarDataModel: HourlyCalculator, DailyCalculator {
    
    var db: Firestore
    
    init(with db: Firestore) {
        self.db = db
    }
    
    func fetchHourlyCount() -> [Double] {
        return self.calculateCountByHour()
    }
    
    func fetchDailyCount() -> [Double ] {
        return self.calculateCountByHour()
    }
    

}
