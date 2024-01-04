//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 29/12/23
// Copyright (C) 2023  Mattoje
//


import SwiftUI

@main
struct DavisISSMenuBarApp: App {
    @State var externalTemp:Double=0
    @State var isConnected: Bool=false
    @State var connStatus:String="Disconnected"
    var body: some Scene {
        MenuBarExtra {
            ContentView(externalTemp: $externalTemp,isConnected: $isConnected,connStatus:$connStatus)
        }
    label: {
        MenuBarView(externalTemp: $externalTemp,isConnected: $isConnected,connStatus:$connStatus)
    }
    .menuBarExtraStyle(.window)
    }
}
