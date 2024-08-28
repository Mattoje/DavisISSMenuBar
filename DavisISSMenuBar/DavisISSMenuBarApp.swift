//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 29/12/23
// Copyright (C) 2023  Mattoje
//


import SwiftUI

@main
struct DavisISSMenuBarApp: App {
    @State var externalTemp:Double=0
    @State var rainRate:Double=0
    @State var windSpeedAvgLast2Min:Double=0
    @State var isConnected: Bool=false
    @State var networkLocked=false
    @State var connStatus:String = "Disconnected"
    @State var consoleOsVersion = "Unknown"
    @State var consoleRadioVersion = "Unknown"
    @State var consoleSwVersion = "Unknown"
    var body: some Scene {
        MenuBarExtra {
            ContentView(externalTemp: $externalTemp,rainRate: $rainRate, windSpeedAvgLast2Min: $windSpeedAvgLast2Min,isConnected: $isConnected,connStatus:$connStatus,networkLocked:$networkLocked,consoleOsVersion:$consoleOsVersion,consoleRadioVersion:$consoleRadioVersion,consoleSwVersion:$consoleSwVersion)
        }
    label: {
        MenuBarView(externalTemp: $externalTemp,rainRate: $rainRate,windSpeedAvgLast2Min: $windSpeedAvgLast2Min,isConnected: $isConnected,connStatus:$connStatus,networkLocked:$networkLocked,consoleOsVersion:$consoleOsVersion,consoleRadioVersion:$consoleRadioVersion,consoleSwVersion:$consoleSwVersion)
    }
    .menuBarExtraStyle(.window)
    }
}
