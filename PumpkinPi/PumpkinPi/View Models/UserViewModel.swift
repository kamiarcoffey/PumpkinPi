//
//  UserViewModel.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/13/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

// At this point the model is Firebase
// Responsible for connecting to and fetching from Firebase

// 3rd party code from firebase documentation about fetching https://firebase.google.com/docs/firestore/query-data/listen

import Foundation
import Firebase
import FirebaseDatabase

// TODO: fix try in fetching counts
// the 'model' is cloud Firestore

class UserViewModel: CurrentCountCalculator, HourlyCalculator, DailyCalculator, ObservableObject {

    var db: Firestore
    
    @Published var currentCount: Int
    @Published var weeklyData = [(Double, String)]() // size 7
    @Published var hourlyData = [(Double, String)]() // size 24
    
    init() {
        self.currentCount = 0
        self.db = Firestore.firestore()
        self.fetchHourlyCount()
        self.fetchCurrentCount()
    }
    
    func fetchCurrentCount() {
       db.collection("cameraData").document("realTime")
        .addSnapshotListener { documentSnapshot, error in
          guard let document = documentSnapshot else {
            print("Error fetching document: \(error!)")
            return
          }
          guard let data = document.data() else {
            print("Document data was empty.")
            return
          }
          print("Current data: \(data)")
        }

    }

    
    func fetchHourlyCount() {
        let dayValues: [Double] = self.calculateCountByHour()
        let dayLabels: [String] = ["Mon", "Tue","Wed","Thu","Fri","Sat","Sun"]
        self.hourlyData = Array(zip(dayValues, dayLabels))
    }
    
    func fetchDailyCount() {
        let hourValues: [Double] = self.calculateCountByHour()
        let hourLabels: [String] = Array(0...24).map{ String($0) }
        self.hourlyData = Array(zip(hourValues, hourLabels))
    }

    
    
}
