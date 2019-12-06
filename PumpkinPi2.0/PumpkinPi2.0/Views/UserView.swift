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
    @ObservedObject var userViewModel = CarDataViewModel()

    
    init() {
//        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
//        self.userViewModel = CarDataViewModel()
//        self.displayBarValues = [userViewModel.weeklyData, userViewModel.hourlyData]
    }
    
    var body: some View {
        VStack {
            Text("Current Count: \(self.userViewModel.currentCount)").font(.system(size: 20)).fontWeight(.bold)
           Spacer()
            Button(action: {
                self.userViewModel.fetchCurrentCount()
                self.userViewModel = 
            }, label: {
                Text("Refresh")
                       .foregroundColor(.white)
                       .padding(.all, 6)
                       .background(Color.blue, alignment: .top)
                       .font(.system(size: 20))
                    .shadow(radius: 5)
                
            })
            
            Spacer()
            
            ZStack{
                VStack{
//                    Text("How Busy Is it Historically?")
//                        .font(.system(size: 20))
//                    .fontWeight(.bold)
//
//                    Picker(selection: $pickerSelection, label: Text("Time Frame"))
//                    {
//                        Text("Daily").tag(0)
//                        Text("Hourly").tag(1)
//                    }.pickerStyle(SegmentedPickerStyle())
//                        .padding(.horizontal, 10)
                    
                    
                    List {
                        ForEach(userViewModel.graphData, id: \.id) { graph in
                            BarChartView(series: graph.data, title: "")
                            }
                    }
                    
//                    HStack(alignment: .center, spacing: 10){
//                        BarChartView(series: displayBarValues[pickerSelection], title: "")
//
//                    }.padding(.top, 24).animation(.default)
                }
            }
        }
    }
}
