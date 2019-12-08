//
//  AdminView.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/13/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

//===----------------------------------------------------------------------===//
//
//  This is the view for controlling the Pi
//  This view uses a modified pattern closer to MVC than MVVM
//  since it speaks directly to the command manager without a ViewModel
//
//===----------------------------------------------------------------------===//

import Foundation
import SwiftUI

struct AdminView: View {

    let commandManager = CommandManager.shared
    
    var body: some View {
        VStack {
         Button(action: {
            self.commandManager.resetCount()
         }, label: {
             Text("Reset Count To 0")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(Color.blue, alignment: .top)
                    .font(.system(size: 20))
                 .shadow(radius: 5)
         })
        }
    }
}
