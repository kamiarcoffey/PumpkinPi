//
//  CurrentCountCalculator.swift
//  PumpkinPi2.0
//
//  Created by Kamiar Coffey on 12/2/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

protocol CurrentCountCalculator: FrequencyCalculator {
    func calculateCurrentCount()  -> Int
}
