//
//  ResetCountCommand.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/18/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class ResetCountCommand: Command {
    
    let userViewModel: UserViewModel
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
    }
    
    func execute() {
        self.userViewModel.resetCount()
    }
}
