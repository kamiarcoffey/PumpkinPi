//
//  ResetCountCommand.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//


//===----------------------------------------------------------------------===//
//
//  This concrete implementation of the Command pattern is for sending
//  networking requests to the Firebase database
//
//===----------------------------------------------------------------------===//

import Foundation
import Firebase
import FirebaseFirestore


class ResetCountCommand: Command {
    
    let db: Firestore
    
    init() {
       let settings = FirestoreSettings()
              Firestore.firestore().settings = settings
              self.db = Firestore.firestore()
    }
    
    func execute() {
        self.db.collection("cameraData")
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err)
            } else {
                let document = querySnapshot!.documents.first
                document!.reference.updateData([
                    "currentCount": 0
                ])
            }
        }
    }
}
