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
    
    @ObservedObject var userViewModel = UserViewModel()
    @State var pickerSelection = 0
    @State var barValues : [[CGFloat]] =
        [
            [5,150,50,100,200,110,30,170,50],
            [200,110,30,170,50, 100,100,100,200],
            [10,20,50,100,120,90,180,200,40]
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
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
                        Text("Weekly").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 10)
                    
                    HStack(alignment: .center, spacing: 10)
                    {
                        ForEach(barValues[pickerSelection], id: \.self){
                            data in
                            
                            BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                        }
                    }.padding(.top, 24).animation(.default)
                }
            }
        }
    }
}


struct BarView: View{

    var value: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {

            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: 200).foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: value).foregroundColor(.green)
                
            }.padding(.bottom, 8)
        }
        
    }
}
