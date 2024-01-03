//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 30/12/23
// Copyright (C) 2023  Mattoje
//


import SwiftUI

struct MenuBarView: View {
    var externalTemp:Double
    var isConnected:Bool
    var body: some View {
        HStack(alignment: .center){
            if isConnected==true{
                Text("\(externalTemp, specifier: "%.1f")°")
            } else{
                Image(systemName: "thermometer.medium.slash").resizable()
            }
            
        }
    }
}

#Preview {
    MenuBarView(externalTemp: 0, isConnected: true)
}
#Preview {
    MenuBarView(externalTemp: 0, isConnected: false)
}
