//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 29/12/23
// Copyright (C) 2023  Mattoje
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    let myISSid=43 //Vantage Pro2 Wireless
    
    @Binding var externalTemp:Double
    @Binding var isConnected:Bool
    @State private var connStatus:String="Disconnected"
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
            TextField("Station ID", text: $stationId)
            TextField("Station Api Key", text: $stationApiKey)
            TextField("Station Api Secret", text: $stationApiSecret)
            Button(isConnected ?  "Disconnect":"Connect"){
                
                if (stationId != "" && stationApiKey != "" && stationApiSecret != "" ) {
                Task.init{
                    let (jsondata,cstatus) = await getDataFromMyWeatherlink(stationId,stationApiKey,stationApiSecret)
                    if cstatus{
                        let sensorsList = try? JSONDecoder().decode(Sensors.self, from: jsondata)
                        if let tempSensor = sensorsList!.sensors.first(where: {$0.sensorType == myISSid}) {
                            let celsiusTemp = (tempSensor.data[0].temp! - 32) * 5/9
                            externalTemp=celsiusTemp
                            isConnected=true
                            let formatter = DateFormatter()
                            formatter.dateStyle = .medium
                            formatter.timeStyle = .short
                            connStatus="Connected: "+formatter.string(from: Date())
                        } else {
                            isConnected=false
                            connStatus="No Sensors Detected"
                        }
                    } else {
                        isConnected=false
                        connStatus=String(decoding: jsondata, as: UTF8.self)
                        print("Error:",String(decoding: jsondata, as: UTF8.self))
                    }
                }
            }
                else {
                    connStatus="Fill all the required fields"
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
    ContentView(externalTemp: .constant(0), isConnected: .constant(false))
}
#Preview {
    ContentView(externalTemp: .constant(0), isConnected: .constant(true))
}
