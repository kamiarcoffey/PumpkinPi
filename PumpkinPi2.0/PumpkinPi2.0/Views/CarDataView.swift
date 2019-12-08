//
//  UserView.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/13/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

//===----------------------------------------------------------------------===//
//
//  This is the view for seeing car cata. It will call subviews to populate graphs
//
//===----------------------------------------------------------------------===//

import Foundation
import SwiftUI

struct CarDataView: View {
    
    @State var pickerSelection = 0
    @ObservedObject var userViewModel = CarDataViewModel()

    
    init() {
    }
    
    var body: some View {
        VStack {
            Text("Current Count: \(self.userViewModel.currentCount)").font(.system(size: 20)).fontWeight(.bold)
           Spacer()
            Button(action: {
                self.userViewModel.fetchCurrentCount()
                self.userViewModel.updateCounts()
            }, label: {
                Text("Refresh")
                       .foregroundColor(.white)
                       .padding(.all, 6)
                       .background(Color.blue, alignment: .top)
                       .font(.system(size: 20))
                    .shadow(radius: 5)
                
            })
                        
            ZStack{
                VStack{
                    ForEach(userViewModel.graphData, id: \.id) { graph in
                        BarChartView(series: graph.data, title: "")
                        }
                }
            }
        }
    }
}



