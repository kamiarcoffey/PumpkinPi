//
//  PiOnCommand.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

// pass it some sort of Pi IP

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
