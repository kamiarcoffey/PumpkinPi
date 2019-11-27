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
    @ObservedObject var userViewModel: UserViewModel

    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        self.userViewModel = UserViewModel()
        self.displayBarValues = [userViewModel.weeklyData, userViewModel.hourlyData]
    }
    
    var body: some View {
        VStack {
            Text("Current Count: \(self.userViewModel.currentCount)")
            
            Button(action: {
                self.userViewModel.fetchCurrentCount()
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


//struct BarView: View{
//
//    var value: CGFloat
//    var cornerRadius: CGFloat
//
//    var body: some View {
//        VStack {
//
//            ZStack (alignment: .bottom) {
//                RoundedRectangle(cornerRadius: cornerRadius)
//                    .frame(width: 30, height: 200).foregroundColor(.white)
//                RoundedRectangle(cornerRadius: cornerRadius)
//                    .frame(width: 30, height: value).foregroundColor(.green)
//
//            }.padding(.bottom, 8)
//        }
//
//    }
//}


//                        ForEach(barValues[pickerSelection], id: \.self){
//                            data in
//
//                            BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
//                        }
