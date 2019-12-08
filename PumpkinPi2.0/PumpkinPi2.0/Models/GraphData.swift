//
//  GraphData.swift
//  PumpkinPi2.0
//
//  Created by Kamiar Coffey on 12/6/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

//===----------------------------------------------------------------------===//
//
//  This data structure is used for packaging data that CarDataViewModel sends
//  Note to new users: Swift structs are passed by value
//
//===----------------------------------------------------------------------===//

import Foundation

struct GraphData: Hashable, Identifiable {
    var id = UUID()
    var data: [(Double, String)]
    
}

extension GraphData {
    static func == (lhs: GraphData, rhs: GraphData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
