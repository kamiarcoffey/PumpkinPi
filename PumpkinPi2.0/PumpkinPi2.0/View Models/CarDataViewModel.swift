//
//  CarDataViewModel.swift
//  PumpkinPi2.0
//
//  Created by Kamiar Coffey on 12/1/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class CarDataViewModel: ObservableObject, HourlyCalculator, DailyCalculator, CurrentCountCalculator{
    
    func calculateCurrentCount() -> Int {
        return 100
    }
    
    
    var db: Firestore
    var carDataModel: CarDataModel
    
    @Published var currentCount: Int
    @Published var weeklyData = [(Double, String)]() // size 7
    @Published var hourlyData = [(Double, String)]() // size 24
    
    init() {
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        self.db = Firestore.firestore()
        
        self.carDataModel = CarDataModel(with: self.db)
        self.currentCount = 0
        
        let dayValues: [Double] = self.carDataModel.calculateCountByHour()
        let dayLabels: [String] = ["Mon", "Tue","Wed","Thu","Fri","Sat","Sun"]
        self.weeklyData = Array(zip(dayValues, dayLabels))
        
        let hourValues: [Double] = self.carDataModel.calculateCountByHour()
        let hourLabels: [String] = Array(0...24).map{ String($0) }
        self.hourlyData = Array(zip(hourValues, hourLabels))
        self.fetchCurrentCount()
    }
    
    func fetchCurrentCount() {
        let docRef = db.collection("cameraData").document("realTime")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                let count = document.data()!["currentCount"]! as? Int
                self.currentCount = count!
            } else {
                print("Document does not exist")
            }
        }
    }

}



