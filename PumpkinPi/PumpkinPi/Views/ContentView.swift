//
//  ContentView.swift
//  PumpkinPi
//
//  Created by Kamiar Coffey on 11/13/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            UserView()
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
