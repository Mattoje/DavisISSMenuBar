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
    @Binding var isConnected:Bool
    @Binding var connStatus:String
    @Binding var networkLocked:Bool
    @AppStorage("stationUUID") var stationUUID = ""
    @AppStorage("stationApiKey") var stationApiKey = ""
    @AppStorage("stationApiSecret") var stationApiSecret = ""
    @AppStorage("connOnStartup") var connOnStartup = false
    var body: some View {
        VStack {
            HStack{
                
                if (!isConnected){
                    Image(systemName: "thermometer.medium.slash")
                    Circle()
                        .frame(width: 5,height: 5)
                        .foregroundColor(.gray)
                } else{
                    if (rainRate==0){
                        Image(systemName: "cloud.sun")
                    }
                    else {
                        Image(systemName: "cloud.drizzle")
                        Text("\(rainRate, specifier: "%.1f") mm ")
                    }
                    Circle()
                        .frame(width: 5,height: 5)
                        .foregroundColor(networkLocked ?.orange : .green)
                }
            }
            Text("\(connStatus)")
            Text(connOnStartup ? "Autoconnect":"No autoconnect")
            TextField("Station UUID", text: $stationUUID)
            TextField("Station Api Key", text: $stationApiKey)
            TextField("Station Api Secret", text: $stationApiSecret)
            Button(isConnected ?  "Disconnect":"Connect"){
                if (!isConnected && !networkLocked) {
                    networkLocked=true
                    Task.init{
                        (externalTemp,rainRate,isConnected,connOnStartup,connStatus) = await startupconn(stationUUID,stationApiKey,stationApiSecret)
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
    ContentView(externalTemp: .constant(0), rainRate: .constant(0),isConnected: .constant(false), connStatus: .constant("Disconnected"),networkLocked:.constant(false))
}
#Preview {
    ContentView(externalTemp: .constant(0), rainRate: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false))
}
#Preview {
    ContentView(externalTemp: .constant(0), rainRate: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(true))
}
#Preview {
    ContentView(externalTemp: .constant(0), rainRate: .constant(20), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(true))
}
