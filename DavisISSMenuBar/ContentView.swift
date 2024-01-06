//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 29/12/23
// Copyright (C) 2023  Mattoje
//

import SwiftUI
import Foundation

struct ContentView: View {
    @Binding var externalTemp:Double
    @Binding var isConnected:Bool
    @Binding var connStatus:String
    @Binding var networkLocked:Bool
    @AppStorage("stationId") var stationId = ""
    @AppStorage("stationApiKey") var stationApiKey = ""
    @AppStorage("stationApiSecret") var stationApiSecret = ""
    @AppStorage("connOnStartup") var connOnStartup = false
    var body: some View {
        VStack {
            Image(systemName: "cloud.sun")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(connStatus)")
            Text(connOnStartup ? "Autoconnect":"No autoconnect")
            TextField("Station ID", text: $stationId)
            TextField("Station Api Key", text: $stationApiKey)
            TextField("Station Api Secret", text: $stationApiSecret)
            Button(isConnected ?  "Disconnect":"Connect"){
                if (!isConnected && !networkLocked) {
                    networkLocked=true
                    Task.init{
                        (externalTemp,isConnected,connOnStartup,connStatus) = await startupconn(stationId,stationApiKey,stationApiSecret)
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
    ContentView(externalTemp: .constant(0), isConnected: .constant(false), connStatus: .constant("Disconnected"),networkLocked:.constant(false))
}
#Preview {
    ContentView(externalTemp: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false))
}
