//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 29/12/23
// Copyright (C) 2023  Mattoje
//

import SwiftUI
import Foundation

struct ContentView: View {
    @Binding var externalTemp:Double
    @Binding var rainRate:Double
    @Binding var windSpeedAvgLast2Min:Double
    @Binding var isConnected:Bool
    @Binding var connStatus:String
    @Binding var networkLocked:Bool
    @State private var showDisclosure = false
    @AppStorage("stationUUID") var stationUUID = ""
    @AppStorage("stationApiKey") var stationApiKey = ""
    @AppStorage("stationApiSecret") var stationApiSecret = ""
    @AppStorage("connOnStartup") var connOnStartup = false
    var body: some View {
        VStack {
            HStack {
                
                if (!isConnected){
                    Image(systemName: "thermometer.medium.slash")
                } else {
                    if (windSpeedAvgLast2Min>0){
                        Text("Wind Speed: \(windSpeedAvgLast2Min, specifier: "%.1f") Km/h ")
                    }
                    if (rainRate==0){
                        Image(systemName: "cloud.sun")
                    }
                    else {
                        Text("Rain Rate: \(rainRate, specifier: "%.1f") mm ")
                    }
                }
            }
            
            HStack{
                Text("\(connStatus)")
                if (isConnected){
                Circle()
                    .frame(width: 5,height: 5)
                    .foregroundColor(networkLocked ?.orange : .green)
                } else {
                    Circle()
                        .frame(width: 5,height: 5)
                        .foregroundColor(.gray)
                }
            }
            Text(connOnStartup ? "Autoconnect":"No autoconnect")
            Text("Station UUID: \(stationUUID)")
            DisclosureGroup("Credentials", isExpanded: $showDisclosure) {
                TextField("Station UUID", text: $stationUUID)
                TextField("Station Api Key", text: $stationApiKey)
                TextField("Station Api Secret", text: $stationApiSecret)
            }
            Button(isConnected ?  "Disconnect":"Connect"){
                if (!isConnected && !networkLocked) {
                    networkLocked=true
                    Task.init{
                        (externalTemp,rainRate,windSpeedAvgLast2Min,isConnected,connOnStartup,connStatus) = await startupconn(stationUUID,stationApiKey,stationApiSecret)
                    }
                    networkLocked=false
                }
                else {
                    isConnected=false
                    connOnStartup=false
                    connStatus="Disconnected by user"
                }
            }
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
        .padding()
    }
}
#Preview {
    ContentView(externalTemp: .constant(0), rainRate: .constant(0),windSpeedAvgLast2Min: .constant(1), isConnected: .constant(false), connStatus: .constant("Disconnected"),networkLocked:.constant(false))
}
#Preview {
    ContentView(externalTemp: .constant(15), rainRate: .constant(0), windSpeedAvgLast2Min: .constant(0),isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false))
}
#Preview {
    ContentView(externalTemp: .constant(16), rainRate: .constant(0), windSpeedAvgLast2Min: .constant(1), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(true))
}
#Preview {
    ContentView(externalTemp: .constant(17), rainRate: .constant(20), windSpeedAvgLast2Min: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(true))
}
#Preview {
    ContentView(externalTemp: .constant(17), rainRate: .constant(20), windSpeedAvgLast2Min: .constant(1), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(true))
}
