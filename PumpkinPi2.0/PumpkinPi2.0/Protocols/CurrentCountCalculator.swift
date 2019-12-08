//
//  CurrentCountCalculator.swift
//  PumpkinPi2.0
//
//  Created by Kamiar Coffey on 12/2/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

//===----------------------------------------------------------------------===//
//
//  This protocol defines the interface for ViewModels to format car data
//  into intervals of a single current count
//
//===----------------------------------------------------------------------===//
protocol CurrentCountCalculator: FrequencyCalculator {
    func calculateCurrentCount()  -> Int
}
