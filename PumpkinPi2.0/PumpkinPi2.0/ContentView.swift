//
//  ContentView.swift
//  PumpkinPi2.0
//
//  Created by Kamiar Coffey on 12/1/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

//===----------------------------------------------------------------------===//
//
//  This is the first view struct loaded by AppDelegate
//  It contains a TabView which sepearates UI into viewing car data and controlling the Pi
//
//===----------------------------------------------------------------------===//

import SwiftUI

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            CarDataView()
                .padding(.top)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("View Data")
            }.tag(0)
            
            AdminView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Control Camera")
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
