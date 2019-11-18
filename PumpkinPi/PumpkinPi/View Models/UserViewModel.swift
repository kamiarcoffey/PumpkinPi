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

class UserViewModel: ObservableObject {
    
    @Published var currentCount: Int
    var db: Firestore!
    
    init() {
        self.currentCount = 10
        db = Firestore.firestore()
//        self.fetchCurrentCount()
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
                self.currentCount = data.count
        }
    }
    
    func resetCount() {
        db.collection("cameraData").document("realTime").setValue(0, forKey: "currentCount")
    }
    
}
