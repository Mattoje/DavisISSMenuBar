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
                if (!isConnected) {
                    startupconn()
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
    func startupconn(){
        if (stationId != "" && stationApiKey != "" && stationApiSecret != "" ) {
            Task.init{
                let (jsondata,cstatus) = await getDataFromMyWeatherlink(stationId,stationApiKey,stationApiSecret)
                if cstatus{
                    if let sensorsList = try? JSONDecoder().decode(WeatherLinkResults.self, from: jsondata) {
                        if let tempSensor = sensorsList.sensors.first(where: {$0.sensor_type == myISSid}) {
                            let celsiusTemp = (tempSensor.data[0].temp! - 32) * 5/9
                            externalTemp=celsiusTemp
                            isConnected=true
                            connOnStartup = true
                            let formatter = DateFormatter()
                            formatter.dateStyle = .medium
                            formatter.timeStyle = .long
                            connStatus="Connected: "+formatter.string(from: Date())
                        } else {
                            isConnected=false
                            connStatus="No Sensors Detected"
                        }
                    }
                    else {
                        isConnected=false
                        connStatus="Json Decoding Error"
                    }
                } else {
                    isConnected=false
                    connStatus=String(decoding: jsondata, as: UTF8.self)
                }
            }
        }
        else {
            connStatus="Fill all the required fields"
        }
    }
}
#Preview {
    ContentView(externalTemp: .constant(0), isConnected: .constant(false), connStatus: .constant("Disconnected"))
}
#Preview {
    ContentView(externalTemp: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"))
}
