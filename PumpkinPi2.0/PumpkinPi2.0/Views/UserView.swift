//
//  UserView.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/13/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI


struct UserView: View {
    
    @State var pickerSelection = 0
    var displayBarValues = [[(Double, String)]]()
    @ObservedObject var userViewModel: CarDataViewModel

    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        self.userViewModel = CarDataViewModel()
        self.displayBarValues = [userViewModel.weeklyData, userViewModel.hourlyData]
    }
    
    var body: some View {
        VStack {
            Text("Current Count: \(self.userViewModel.currentCount)")
            
            Button(action: {
                print("refreshing data...")
            }, label: {Text("Refresh")
                
            })
        
            ZStack{
                VStack{
                    Text("Bar Charts")
                        .font(.largeTitle)
                    
                    Picker(selection: $pickerSelection, label: Text("Time Frame"))
                    {
                        Text("Daily").tag(0)
                        Text("Hourly").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 10)
                    
                    HStack(alignment: .center, spacing: 10)
                    {
                        BarChartView(series: displayBarValues[pickerSelection], title: "Busy Times")

                    }.padding(.top, 24).animation(.default)
                }
            }
        }
    }
}
