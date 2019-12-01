//
//  ResetCountCommand.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import Firebase

// pass it the db?

class ResetCountCommand: Command {
    
    
    init() {
        
    }
    
    func execute() {
//        Firestore.firestore().collection("cameraData").document("realTime").setValue(0, forKey: "currentCount")
    }
}
