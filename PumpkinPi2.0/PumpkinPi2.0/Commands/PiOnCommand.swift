//
//  PiOnCommand.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

//===----------------------------------------------------------------------===//
//
//  This concrete implementation of the Command pattern is for sending
//  HTTP reqests to the Flask server running on the Pi
//
//===----------------------------------------------------------------------===//

import Foundation

struct PiOnCommand: Command {
    
    let piConnecton: Any
    
    init(piConnecton: Any) {
        self.piConnecton = piConnecton
    }
    
    func execute() {
        //
        // piConnecton.sendSignal()
    }
    
}
