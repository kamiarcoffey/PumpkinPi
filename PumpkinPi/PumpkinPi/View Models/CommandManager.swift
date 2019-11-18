//
//  CommandManager.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class CommandManager {
    
    private var onCommands = [Command]()
    private var offCommands = [Command]()
    private var databaseCommands = [Command]()
    
    func setCommand(database command: Command) {
        self.databaseCommands.append(command)
    }
    
    func setCommand(on command: Command) {
        self.onCommands.append(command)
    }
    
    func setCommand(of command: Command) {
        self.offCommands.append(command)
    }
    
    func startPi() {
        self.onCommands.forEach{ $0.execute() }
    }
    
    func stopPi() {
        self.offCommands.forEach{ $0.execute() }
    }
    
}
