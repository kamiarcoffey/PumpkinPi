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


struct GraphData: Hashable, Identifiable {
    var id = UUID()
    var data: [(Double, String)]
    
}

extension GraphData {
    static func == (lhs: GraphData, rhs: GraphData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class CarDataViewModel: ObservableObject {
    
    var db: Firestore
    
    @Published var currentCount: Int
//    @Published var weeklyData = [(Double, String)]() // size 7
//    @Published var hourlyData = [(Double, String)]() // size 24
    @Published var graphData = [GraphData]()

    
    init() {
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        self.db = Firestore.firestore()
        
        self.currentCount = 0
        
        self.fetchCurrentCount()
        self.fetchCarEvents() { (carData) in
            let dayValues: [Double] = self.fetchCount(dataSeries: carData, interval: .weekday)
            let dayLabels: [String] = ["Mon", "Tue","Wed","Thu","Fri","Sat","Sun"]
//            self.weeklyData = Array(zip(dayValues, dayLabels))
    
            let hourValues: [Double] = self.fetchCount(dataSeries: carData, interval: .hour)
            let hourLabels: [String] = Array(0...24).map{ String($0) }
//            self.hourlyData = Array(zip(hourValues, hourLabels))
            
            self.graphData = [GraphData(data: Array(zip(dayValues, dayLabels))), GraphData(data: Array(zip(hourValues, hourLabels)))]
            
//            print(self.weeklyData, self.hourlyData)
        }
    }
    
    func dayOfTheWeek(_ date: Date) -> Int {
           let myCalendar = Calendar(identifier: .gregorian)
           let weekDay = myCalendar.component(.weekday, from: date)
           return weekDay
       }
       
       func hourOfDay(_ date: Date) -> Int {
           let myCalendar = Calendar(identifier: .gregorian)
           let hour = myCalendar.component(.hour, from: date)
           return hour
       }
    
    func fetchCurrentCount() {
        let docRef = db.collection("cameraData").document("realTime")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                _ = document.data().map(String.init(describing:)) ?? "nil"
                let count = document.data()!["currentCount"]! as? Int
                self.currentCount = count!
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func fetchCarEvents(completionHandler: @escaping ([(Date, Bool)]) -> Void ) {
        db.collection("carEvents") //.whereField("timeStamp) ...
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    let res = querySnapshot!.documents.reduce(into: [(Date, Bool)]()) { acc, element in
                        let dict = element.data() as? [String: AnyObject]
                        let date = Date(timeIntervalSince1970: (TimeInterval(dict!["timeStamp"]!.seconds!)))
                        let isEntry = dict!["isEntry"]! as! Bool
                        acc += [(date, isEntry)]
                    }
                    completionHandler(res)
                }
        }
    }
    
    func hourlyCounts(dataSeries: [(Date, Bool)]) -> [Double] {
       return dataSeries.reduce(into: [Double](repeating: 0.1, count: 25)) { acc, element in
            let day = hourOfDay(element.0)
            acc[day] += 1
        }
    }
    
    func dailyCounts(dataSeries: [(Date, Bool)]) -> [Double] {
        return dataSeries.reduce(into: [Double](repeating: 0.1, count: 8)) { acc, element in
            let day = dayOfTheWeek(element.0)
            acc[day] += 1
        }
    }
    
    func fetchCount(dataSeries: [(Date, Bool)], interval: Calendar.Component) -> [Double]{
        switch interval {
        case .hour:
            return self.hourlyCounts(dataSeries: dataSeries)
        case .weekday:
            return self.dailyCounts(dataSeries: dataSeries)
        default:
            return [Double]()
        }
    }
    
}



