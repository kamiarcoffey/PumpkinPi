//
//  CarDataModel.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 12/1/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//


//import Foundation
//import Firebase
//import FirebaseDatabase
//import Combine
//
//class CarDataModel: IntervalCalculator {
//
//    var db: Firestore
//    var carEvents = [(Date, Bool)]()
//
//    init(with db: Firestore) {
//        self.db = db
//        self.fetchCarEvents() { (carData) in self.carEvents = carData }
//    }
//
//    func dayOfTheWeek(_ date: Date) -> Int {
//        let myCalendar = Calendar(identifier: .gregorian)
//        let weekDay = myCalendar.component(.weekday, from: date)
//        return weekDay
//    }
//
//    func hourOfDay(_ date: Date) -> Int {
//        let myCalendar = Calendar(identifier: .gregorian)
//        let hour = myCalendar.component(.hour, from: date)
//        return hour
//    }
//
//
//    func fetchCarEvents(completionHandler: @escaping ([(Date, Bool)]) -> Void ) {
//        db.collection("carEvents") //.whereField("timeStamp) ...
//            .getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    let res = querySnapshot!.documents.reduce(into: [(Date, Bool)]()) { acc, element in
//                        let dict = element.data() as? [String: AnyObject]
//                        let date = Date(timeIntervalSince1970: (TimeInterval(dict!["timeStamp"]!.seconds!)))
//                        let isEntry = dict!["isEntry"]! as! Bool
//                        acc += [(date, isEntry)]
//                    }
//                    completionHandler(res)
//                }
//        }
//    }
//
//    var hourlyCounts: [Double] {
//       return self.carEvents.reduce(into: [Double](repeating: 0.1, count: 24)) { acc, element in
//            let day = hourOfDay(element.0)
//            acc[day] += 1
//        }
//    }
//
//    var dailyCounts: [Double] {
//        return self.carEvents.reduce(into: [Double](repeating: 0.1, count: 7)) { acc, element in
//            let day = dayOfTheWeek(element.0)
//            acc[day] += 1
//        }
//    }
//
//    func fetchCount(interval: Calendar.Component) -> [Double]{
//        switch interval {
//        case .hour:
//            return self.hourlyCounts
//        case .weekday:
//            return self.dailyCounts
//        default:
//            return [Double]()
//        }
//    }
//
//
//}
